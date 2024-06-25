locals {
  comman_tags = {
    Environment = var.environment
    ManagedBy   = var.team
  }
}

data "aws_ami" "this" {
  most_recent = true
  owners      = var.ami_filter.owners

  filter {
    name   = "name"
    values = var.ami_filter.ami_name
  }

  filter {
    name   = "virtualization-type"
    values = var.ami_filter.virtualization_type
  }

  filter {
    name   = "architecture"
    values = var.ami_filter.architecture
  }
}

resource "aws_instance" "webserver" {
  count = var.webserver_goldan_ami ? 1 : 0
  ami           = data.aws_ami.this.id
  instance_type = var.instance_type
  user_data     = file("${path.module}/scripts/webserver.sh")

  tags = merge(
    local.comman_tags,
    { Name = "WEBSERVER-IMAGE-${var.environment}" }
  )
}

resource "aws_ami_from_instance" "goldan_image" {
  count = var.webserver_goldan_ami ? 1 : 0
  name               = "GOLDAN-IMAGE-${var.team}-${var.environment}"
  source_instance_id = aws_instance.webserver[0].id

  tags = merge(
    local.comman_tags,
    { Name = "WEBSERVER-GOLDAN-IMAGE-${var.environment}" }
  )
}