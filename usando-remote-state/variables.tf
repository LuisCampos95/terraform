variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "luis"
}

variable "ami" {
  type        = string
  description = ""
  default     = "ami-0a8b4cd432b1c3063"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}
