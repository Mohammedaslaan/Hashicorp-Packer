packer {
  required_plugins {
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}
function convert_to_numbers_only(date_string) {
  # Extract numbers from the date string using a regular expression
  numbers_only = regexall("[0-9]", date_string)

  # Concatenate the numbers to form a single string
  result = join("", numbers_only)

  return result
}
source "amazon-ebs" "ubuntu" {
  region        = var.ami-creation-region
  ami_name = "${var.ami_target_name}-${convert_to_numbers_only(local.timestamp)}"
  instance_type = var.instance_type
  source_ami_filter {
    filters = {
      name                = "al2023-ami-2023.3.20231218.0-kernel-6.1-x86_64"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners       = ["137112412989"]
  }
  ssh_username = var.ssh_username
}


build {
  sources = ["source.amazon-ebs.ubuntu"]

    provisioner "ansible" {
      playbook_file = "./playbook.yml"
    }
}
