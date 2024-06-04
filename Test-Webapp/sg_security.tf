resource "aws_security_group" "web_app_sg" {
  name   = "web-app-sg"
  vpc_id = "vpc-0db721ef6d92da2bb"
}
resource "aws_vpc_security_group_ingress_rule" "web_app_sg_ipv4" {
  security_group_id = aws_security_group.web_app_sg.id
  cidr_ipv4         = "101.176.70.111/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "web_app_sg_ipv4" {
  security_group_id = aws_security_group.web_app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web_app_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
