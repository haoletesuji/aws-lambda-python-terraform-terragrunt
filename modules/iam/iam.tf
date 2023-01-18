resource "aws_iam_role" "role" {
  name = var.name

  assume_role_policy = file(var.role_policy_file_path)
}

resource "aws_iam_policy" "policy" {
  name   = "${var.name}-policy"
  policy = file(var.policy_file_path)
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
