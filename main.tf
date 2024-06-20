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