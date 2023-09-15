variable "aws_region" {
  type          = string
  description   = "AWS region"
}

variable "environment" {
    description = "Environment Variable used to tag resources"
    type = string
}
