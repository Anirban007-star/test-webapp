resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaledown"{
alarm_name    = "example-cpu-alarm-scaledown"
alarm_description = "example-cpu-alarm-scaledown"
comparison_operator = "GreaterThanOrEqualToThreesold"
evaluation_periods = "2"
metric_name        = "CPUUtilization"
namespace          = "AWS/EC2"
period             = "120"
statistic          = "Average"
threshold          = "5"
insufficient_data_actions = []


dimensions = {
  "AutoScalingGroups" = "${aws_autoscaling_group.example-autoscaling.name}"
}

actions_enabled = true
alarm_actions = ["${aws_autoscaling_policy.example-cpu-policy-scaledown.arn}"]
}