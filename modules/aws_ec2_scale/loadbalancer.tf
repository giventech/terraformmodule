# The security group allows only incoming http traffice on 80 as 
# We are setting an ALB to with will redirec http traffic on the EC2 instances cluster
# Requirements
# 1. Security group to allow commnication in http incoming http to alb an outgoing to each autoscale EC2
# 2. The application Load Balancer itself to which the Security group is attached
# 3. Listener and Target group to tell load balancer where to redirect the traffic

resource "aws_security_group" "http_traffic" {
  name = "${var.cluster_name}asb"
  vpc_id = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For on prem only
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
   tags = merge({
    Name = "${var.adm_user}-http-traffic-sg"
  }, var.tags)
  
}
# Load balancer 
resource "aws_lb" "admzjl2_alb" {
  name               = "${var.subnet_ids}-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.http_traffic.id]
  subnets            = var.subnet_ids
  tags = merge({
    Name = "${var.adm_user}-iac04-alb"
  }, var.tags)
}
resource "aws_lb_target_group" "admzjl2_tg" {
  name     = "${var.adm_user}-iac04-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}
resource "aws_lb_listener" "admzjl2_lb_listener" {
  load_balancer_arn = aws_lb.admzjl2_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.admzjl2_tg.arn
  }
}

