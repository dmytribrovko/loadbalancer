variable "security_groups" {
  description = "Security group id"
}
variable "subnet_public" {
  description = "Specify one subnet per Availability Zone"
}
variable "vpc" {
  description = "Loadbalancer VPC"
}
variable "target_port" {
  description = "Target group listen port"
}
variable "instance_ids" {
  description = "Target group instance ids"
}
variable "instance_target_port" {
  description = "Instance listen port"
}
variable "certificate_arn" {
  description = "SSL/TLS certificate arn for LB"
}
variable "ssl_policy" {
  description = "Secure Socket Layer (SSL) negotiation configuration"
}