output "target_group" {
  value = aws_lb_target_group.lb_target.arn
}
output "data_aws_lb" {
  value = aws_lb.loadbalancer.dns_name
}
output "this_lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = concat(aws_lb.loadbalancer.*.id, [""])[0]
}

output "this_lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = concat(aws_lb.loadbalancer.*.arn, [""])[0]
}

output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = concat(aws_lb.loadbalancer.*.dns_name, [""])[0]
}

output "this_lb_arn_suffix" {
  description = "ARN suffix of our load balancer - can be used with CloudWatch."
  value       = concat(aws_lb.loadbalancer.*.arn_suffix, [""])[0]
}

output "this_lb_zone_id" {
  description = "The zone_id of the load balancer to assist with creating DNS records."
  value       = concat(aws_lb.loadbalancer.*.zone_id, [""])[0]
}

output "http_tcp_listener_arns" {
  description = "The ARN of the TCP and HTTP load balancer listeners created."
  value       = aws_lb_listener.main.arn
}

output "http_tcp_listener_ids" {
  description = "The IDs of the TCP and HTTP load balancer listeners created."
  value       = aws_lb_listener.main.*.id
}

output "https_listener_arns" {
  description = "The ARNs of the HTTPS load balancer listeners created."
  value       = aws_lb_listener.redirect.*.arn
}

output "https_listener_ids" {
  description = "The IDs of the load balancer listeners created."
  value       = aws_lb_listener.redirect.*.id
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = aws_lb_target_group.lb_target.*.arn
}

output "target_group_arn_suffixes" {
  description = "ARN suffixes of our target groups - can be used with CloudWatch."
  value       = aws_lb_target_group.lb_target.*.arn_suffix
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = aws_lb_target_group.lb_target.*.name
}