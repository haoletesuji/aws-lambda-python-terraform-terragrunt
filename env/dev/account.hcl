locals {
  aws_access_key_id     = get_env("AWS_ACCESS_KEY_ID")
  aws_secret_access_key = get_env("AWS_SECRET_ACCESS_KEY")
  aws_session_token     = get_env("AWS_SESSION_TOKEN")
}
