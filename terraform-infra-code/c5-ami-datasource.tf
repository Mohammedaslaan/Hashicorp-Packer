data "aws_ami" "new-created-ami" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "name"
    values = ["packer*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}