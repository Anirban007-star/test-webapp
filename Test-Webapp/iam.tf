resource "aws_iam_role_policy" "my_ec2_policy" {
  name = "my_ec2_policy"
  role = aws_iam_role.assignment_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_role" "assignment_role" {
  name = "assignment_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}
resource "aws_iam_instance_profile" "Ec2_policy" {
  name = "my_ec2_policy"
  role = aws_iam_role.assignment_role.name_prefix

}
