# ---------------------------
# SNS Topic for Notifications
# ---------------------------
resource "aws_sns_topic" "alarms" {
  name = "infra-alarms-topic"
}

# ---------------------------
# Subscribe Admin Email
# ---------------------------
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.alarms.arn
  protocol  = "email"
  endpoint  = var.admin_email
}

# ---------------------------
# CloudWatch Alarm - Backend CPU > 50%
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "backend_cpu" {
  alarm_name          = "backend-cpu-gt-50"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Trigger when backend CPU > 50%"

  alarm_actions = [aws_sns_topic.alarms.arn]

  dimensions = {
    InstanceId = aws_instance.backend.id
  }
}

# ---------------------------
# CloudWatch Alarm - Frontend CPU > 50%
# ---------------------------
resource "aws_cloudwatch_metric_alarm" "frontend_cpu" {
  alarm_name          = "frontend-cpu-gt-50"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 50
  alarm_description   = "Trigger when frontend CPU > 50%"

  alarm_actions = [aws_sns_topic.alarms.arn]

  dimensions = {
    InstanceId = aws_instance.frontend.id
  }
}
