resource "aws_instance" "web_app_instance" {
  ami                  = "ami-0cc9838aa7ab1dce7"
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.web_app_sg.name]
  iam_instance_profile = aws_iam_instance_profile.Ec2_policy.name_prefix

}
