variable "amg_account_id" {
  description = "Amazon Managed Grafana account id."
  type        = string
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"

    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.amg_account_id}:root"]
    }

    # condition {}
  }
}

data "aws_iam_policy_document" "permission_policy" {
  statement {
    effect = "Allow"

    actions = [
      "aps:ListWorkspaces",
      "aps:DescribeWorkspace",
      "aps:QueryMetrics",
      "aps:GetLabels",
      "aps:GetSeries",
      "aps:GetMetricMetadata"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "cloudwatch:DescribeAlarmsForMetric",
      "cloudwatch:DescribeAlarmHistory",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:ListMetrics",
      "cloudwatch:GetMetricStatistics",
      "cloudwatch:GetMetricData"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "logs:DescribeLogGroups",
      "logs:GetLogGroupFields",
      "logs:StartQuery",
      "logs:StopQuery",
      "logs:GetQueryResults",
      "logs:GetLogEvents"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "ec2:DescribeTags", "ec2:DescribeInstances", "ec2:DescribeRegions"
    ]

    resources = ["*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "tag:GetResources"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role" "default" {
  name               = "AMGDataSourceRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}


resource "aws_iam_role_policy" "default" {
  role   = aws_iam_role.default.id
  policy = data.aws_iam_policy_document.permission_policy.json
}

output "role_id" {
  value       = aws_iam_role.default.id
  description = "Name of the role"
}

output "role_arn" {
  value       = aws_iam_role.default.arn
  description = "Amazon Resource Name (ARN) specifying the role."
}
