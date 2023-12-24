resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

 provisioner "local-exec" {
  command = <<EOT
    [ -e mykey.pem ] && sudo rm -f mykey.pem && echo "${tls_private_key.pk.private_key_pem}" > myKey.pem && chmod 400 myKey.pem
  EOT
}

}