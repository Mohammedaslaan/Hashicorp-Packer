packer {
  required_plugins {
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}
source "amazon-ebs" "ubuntu" {
  region        = var.ami-creation-region
  ami_name      = var.ami_target_name
  instance_type = var.instance_type
  source_ami_filter {
    filters = {
      name                = "amazon/al2023-ami-2023.*-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners       = ["099720109477"]
  }
  ssh_username = var.ssh_username
}


build {
  sources = ["source.amazon-ebs.ubuntu"]
  provisioner "shell" {
    inline = [
      "sudo apt-get -y update",
      "sudo apt-get -y install ansible"
    ]
  }
    provisioner "ansible" {
      playbook_file = "./playbook.yml"
    }
}
