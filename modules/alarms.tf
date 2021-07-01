resource "aws_cloudwatch_metric_alarm" "admzjl2-alarm-increase" {
  alarm_name          = "admzjl2-alarm-increase"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  alarm_description = "This metric monitors excessive ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.asg_inc.arn]
}



resource "aws_cloudwatch_metric_alarm" "admzjl2-alarm-increase" {
  alarm_name          = "admzjl2-alarm-increase"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg.name
  }
  alarm_description = "This metric monitors excessive ec2 cpu utilization"
  alarm_actions     = [aws_autoscaling_policy.asg_inc.arn]
}