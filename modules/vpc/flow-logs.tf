resource "aws_flow_log" "vpc_flow_log" {
  log_destination_type = "s3"
  log_destination = "${var.flowlogs_bucket}/${var.region}/${aws_vpc.environment.id}"
  vpc_id          = aws_vpc.environment.id
  traffic_type    = var.traffic_to_store
}
