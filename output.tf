output "bastion_public_ip" {
  value = aws_instance.bastion-ec2.public_ip
  description = "bastion public ip address"
}

output "nginx_public_ip" {
  value = aws_instance.web-server-ec2.public_ip
  description = "nginx public ip address"
}