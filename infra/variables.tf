variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1" #Região Norte da Virgínia
}

variable "aws_profile" {
  type        = string
  description = ""
  default     = "luis" #Profile criado na configuração da AWS
}

variable "ami" {
  type        = string
  description = ""
  default     = "ami-033b95fb8079dc481" #AMI Linux
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro" #Free Tier
}