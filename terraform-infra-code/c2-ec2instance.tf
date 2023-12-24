resource "aws_instance" "myec2vm" {
  ami = data.aws_ami.new-created-ami.id
  instance_type = var.instance_type_list[0]
  #user_data = filebase64("${path.module}/app1-install.sh")
  tags = {
    "Name" = "Ec2 Demo ${count.index}"
  }
  count = 1
  key_name = var.instance_keypair
  vpc_security_group_ids = [
    aws_security_group.terraform2-SG-ssh.id,
    aws_security_group.terraform2-SG-web.id
  ]
}