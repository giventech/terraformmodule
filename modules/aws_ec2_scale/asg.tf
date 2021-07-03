resource "aws_launch_template" "iac04_launch_template" {
  name_prefix   = "${var.adm_user}-iac04-launch-template"
  image_id      = var.ami
  instance_type = var.instance_type
  user_data     = filebase64("user-data.sh")
  key_name      = "WERWRWERWRW"
  network_interfaces {
    security_groups = [aws_security_group.http_traffic.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags          = merge({ Name = "${var.adm_user}-iac04-asg-instances" }, var.tags)
  }
  tags = merge({
    Name = "${var.adm_user}-iac04-launch-template"
  }, var.tags)
}
resource "aws_autoscaling_group" "iac04_asg" {
  name                = "${var.adm_user}-iac04-asg"
  vpc_zone_identifier = var.subnet_ids
  max_size            = var.max_size
  min_size            = var.min_size
  target_group_arns   = [aws_lb_target_group.admzjl2_tg.arn]
  launch_template {
    id      = aws_launch_template.iac04_launch_template.id
    version = "$Latest"
  }
  tags = [
    {
      Name = "${var.adm_user}-iac04-asg"
    }
  ]
}
resource "aws_autoscaling_policy" "scale_down" {
  name                   = "${var.adm_user}-scale-down"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.iac04_asg.name
}
resource "aws_autoscaling_policy" "scale_up" {
  name                   = "${var.adm_user}-scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.iac04_asg.name
}