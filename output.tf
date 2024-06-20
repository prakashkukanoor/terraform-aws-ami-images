output "ami_image_id" {
  value = data.aws_ami.this.id
}

output "bastion_host_public_ips" {
  value = aws_instance.bastion[*].public_ip
}

output "goldan_image_id" {
    value = aws_ami_from_instance.goldan_image.id
  
}