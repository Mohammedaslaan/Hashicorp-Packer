variable "ami_target_name" {
  description = "Name of AMI that will be created."
  type        = string
  default     = "packer"
}
variable "ami_source_name" {
  description = "Name of source"
  type        = string
  default     = "ubuntu-image"
}
variable "ami_source_owner" {
  description = "source owner"
  type        = string
  default     = "634270476875"
}
variable "ssh_username" {
  description = "Name that will be used to do ssh."
  default     = "ec2-user"
}

variable "ami-creation-region" {
  description = "the region in which ami will be created"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The type of instance which will be used to create ami"
  type        = string
  default     = "t2.micro"
}