variable "aws_region" {
  default = "us-east-1"
}

variable "docker_image" {}

variable "container_name" {
  default = "greencart-frontend"
}

variable "container_port" {
  default = 80
}

variable "desired_count" {
  default = 1
}
