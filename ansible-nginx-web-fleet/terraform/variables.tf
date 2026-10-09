variable "aws_region" {
  description = "Region for the fleet. The console must match this or the instances will not appear."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "t2.micro was rejected on this account as not Free Tier eligible. t3.micro is the size that applied."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Existing EC2 key pair name. The private .pem stays on the workstation and is not committed."
  type        = string
  default     = "ansible-lab-key"
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH. Replace with the operator public IP before apply, for example 203.0.113.10/32."
  type        = string
  default     = "0.0.0.0/0"
}
