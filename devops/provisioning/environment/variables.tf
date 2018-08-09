variable "region" {}

variable "project_name" {}

variable "environment" {}

variable "eb_application" {}

variable "eb_health_check" {
  default = "/health"
}

variable "eb_instance_profile" {}

variable "eb_instance_type" {
  default = "t2.medium"
}

variable "eb_key_pair" {}

variable "db_allocated_storage" {}

variable "db_instance_class" {}

variable "https_domain" {
  default = ""
}

variable "vpc" {}

variable "vpc_subnets" {
  type = "list"
}
