output "bastion_public_ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "bastion public ip address"
}

output "nginx_public_ip" {
  value = aws_instance.web-server-ec2.public_ip
  description = "nginx public ip address"
}

output "web_ssh_private_key" {
  value = tls_private_key.web-ssh-key.private_key_pem
  description = "web server access private pem key"
  sensitive = true
}

output "bastion_ssh_private_key" {
  value = tls_private_key.bastion-ssh-key.private_key_pem
  description = "bastion access private pem key"
  sensitive = true
}