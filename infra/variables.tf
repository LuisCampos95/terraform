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
  default     = "ami-0b0af3577fe5e3532"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}