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

}

variable "instance_type" {
  type = string

}

variable "bastion_host" {
  type    = bool
  default = false

}

variable "environment" {
  type = string

}
variable "team" {
  type = string

}
