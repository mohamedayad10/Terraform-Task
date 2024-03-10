# Define the SNS topic
resource "aws_sns_topic" "cpu_alert" {
  name = "CPUAlerts"
}

# Define the SNS topic subscription (replace email_address)
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.cpu_alert.arn
  protocol  = "email"
  endpoint  = "mohamed.mahmoud.ayad1@gmail.com"
}

# Define the CloudWatch metric alarm for CPU utilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_alarm" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = "50"
  alarm_description   = "Alarm when CPU exceeds 50%"
  alarm_actions       = [aws_sns_topic.cpu_alert.arn]

  dimensions = {
    InstanceId = "aws_instance.frontend.id, aws_instance.backend.id" # Replace with your EC2 instance ID
  }
}