variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami_filter" {
  type = object({
    owners              = list(string)
    ami_name            = list(string)
    virtualization_type = list(string)
    architecture        = list(string)
  })
  default = {
    owners              = ["amazon"]
    ami_name            = ["al2023-ami-2023.4.20240611.0-kernel-6.1-x86_64"]
    virtualization_type = ["hvm"]
    architecture        = ["x86_64"]
  }

}

variable "instance_type" {
  type = string

}

variable "webserver_goldan_ami" {
  type    = bool
  default = false

}

variable "environment" {
  type = string

}
variable "team" {
  type = string

}
