resource "aws_iam_user" "james_lagermann" {
  name = "james.lagermann"
}

resource "aws_iam_user_policy_attachment" "james_laggerman_admin" {
  user = aws_iam_user.james_lagermann.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_role" "terraform_user" {

  assume_role_policy = jsonencode(

  {
    "Version" : "2012-10-17",
    "Statement" : [
#      {
#        Effect : "Allow",
#        Principal : {
#          "AWS" : aws_iam_role.serverless.arn
#        },
#        Action : "sts:AssumeRole"
#      },
      {
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::657159205431:root"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })
  description = "Allows administrative access for terraform running functionality."

  #  id   = "TerraformUser"
  name = "TerraformUser"

  tags = {
    "Name" = "TerraformUser"
  }
}

