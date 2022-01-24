variable "mongo_version" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = "t2.large"
}

variable "vpc_id" {
  type    = string
  default = ""
}