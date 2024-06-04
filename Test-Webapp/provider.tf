provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA47CRZGBL6ZRU6Z45"
  secret_key = "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"
}
resource "aws_instance" "my-ec2" {
  ami           = "ami-00fa32593b478ad6e"
  instance_type = "t2.micro"
}
