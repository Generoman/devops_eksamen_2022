resource "aws_cloudwatch_metric_alarm" "test" {
  alarm_name = "carts-exceeded-5"
  namespace = var.candidate_id
  metric_name = "carts.value"

  comparison_operator = "GreaterThanThreshold"
  threshold = "5"
  evaluation_periods  = "3"
  period = "300"

  statistic = "Maximum"

  alarm_description = "Goes off when the amount of carts exceeds 5 over 3 periods of 5 minutes"
  insufficient_data_actions = []
  alarm_actions = [aws_sns_topic.alarms]
}