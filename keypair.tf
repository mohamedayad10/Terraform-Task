resource "tls_private_key" "privatekey" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "app-key"
  public_key = tls_private_key.privatekey.public_key_openssh
}

output "ssh-key" {

  value     = tls_private_key.privatekey.private_key_pem
  sensitive = true
}
