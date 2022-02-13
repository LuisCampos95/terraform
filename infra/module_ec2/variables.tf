variable "ami" {
  type        = string
  description = ""
  default     = "ami-0b0af3577fe5e3532" #AMI Redhat
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro" #Free Tier
}