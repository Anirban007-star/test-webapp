provider "aws" {
  region     = "ap-south-1"
  access_key = ""
  secret_key = ""
}
resource "aws_instance" "my-ec2" {
  ami           = "ami-00fa32593b478ad6e"
  instance_type = "t2.micro"
}
