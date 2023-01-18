{
  "Comment": "An example of the Amazon States Language using an AWS Lambda Function",
  "StartAt": "AddReferral",
  "States": {
    "AddReferral": {
      "Type": "Task",
      "Resource": "${add_referral_arn}",
      "End": true
    }
  }
}
