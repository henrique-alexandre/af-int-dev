## VPC

module "vpc" {
  source           = "./modules/vpc"
  name             = "${var.product}-vpc"
  product          = var.product
  region           = var.region
  cidr             = var.cidr
  zones            = var.zones
  flowlogs_bucket  = var.flowlogs_bucket
  traffic_to_store = var.traffic_to_store
}

## Subnets

module "public-subnets" {
  # Only Make these if we got flagged to, we _must_ have at least 1 set of public subnets for the natgw set
  count = var.public_subnets_count < 0 ? 1 : var.public_subnets_count

  set_count   = count.index
  source      = "./modules/subnets"
  tags        = var.public_subnet_tags
  product     = var.product
  env         = var.env
  region      = var.region
  cidr        = var.cidr
  subnet_bits = var.subnet_bits
  zones       = var.zones
  vpc_id      = module.vpc.vpc_id
  type        = "public"
  purpose     = "elb"
  public_ip   = "true"
  igw         = module.vpc.igw_id
}

module "private-subnets" {
  # Only Make these if we got flagged to.
  count = var.private_subnets_count

  set_count         = count.index
  source            = "./modules/subnets"
  tags              = var.private_subnet_tags
  product           = var.product
  env               = var.env
  region            = var.region
  cidr              = var.cidr
  subnet_bits       = var.subnet_bits
  subnet_start      = "1"
  zones             = var.zones
  vpc_id            = module.vpc.vpc_id
  type              = "private"
  purpose           = "internal"
  public_ip         = "false"
  nat_gateway_by_az = module.nat.nat_gateway_by_az
}

module "db-subnets" {
  # Only Make these if we got flagged to.
  count = var.database_subnets_count

  set_count         = count.index
  source            = "./modules/subnets"
  tags              = var.db_subnet_tags
  product           = var.product
  env               = var.env
  region            = var.region
  cidr              = var.cidr
  subnet_bits       = var.subnet_bits
  subnet_start      = "2"
  zones             = var.zones
  vpc_id            = module.vpc.vpc_id
  type              = "private"
  purpose           = "db"
  public_ip         = "false"
  nat_gateway_by_az = module.nat.nat_gateway_by_az
}

## NAT Gateway

module "nat" {
  source = "./modules/natgw"
  # This is a terrible bit of jackery to turn the list ouput from the subnets submodule
  # into the map that the natgw wants

  subnets_by_az   = { for v in flatten(module.public-subnets[0].subnets_by_az) : substr(v, 0, 10) => substr(v, 11, -1) }
  persistent_eips = var.persistent_eips

  # Here we can't do the math on outputs of other modules, so we use the top level inputs and do the math on that.  THis is dirty and I feel
  # bad about it.
  eips_to_create  = (length(var.zones) - length(var.persistent_eips)) < 0 ? 0 : length(var.zones) - length(var.persistent_eips)
  natgw_to_create = length(var.zones)

  depends_on = [
    module.public-subnets,
  ]
}
