terraform {
  required_version = ">=0.14"
}

resource "aws_lb" "loadbalancer" {
  internal           = false
  subnets            = var.subnet_public
  security_groups    = var.security_groups
  load_balancer_type = "application"
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target.arn
  }
}

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = aws_lb.loadbalancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group" "lb_target" {
  port        = var.target_port
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc
  health_check {
    enabled   = true
    port      = "traffic-port"
    protocol  = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "lb_target_attach" {
  count            = length(var.instance_ids)
  target_group_arn = aws_lb_target_group.lb_target.arn
  target_id        = element(var.instance_ids, count.index)
  port             = var.instance_target_port
}


