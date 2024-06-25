output "ami_image_id" {
  value = data.aws_ami.this.id
}

output "webserver_instance_id" {
  value = aws_instance.webserver[*].id
}

output "goldan_image_id" {
    value = aws_ami_from_instance.goldan_image[*].id
  
}