resource "aws_cloudwatch_metric_alarm" "high_cpu_usage_alarm" {
  alarm_name          = "${var.adm_user}-iac04-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.iac04_asg.name
  }
  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_up.arn]
}
resource "aws_cloudwatch_metric_alarm" "low_cpu_usage_alarm" {
  alarm_name          = "${var.adm_user}-iac04-low-cpu"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "20"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.iac04_asg.name
  }
  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.scale_down.arn]
}