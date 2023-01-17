# AWS-Lambda + Python + Terraform + Terragrunt

Deploys your Python functions in minutes!

This is a template to deploy Python functions rapidly on AWS-Lambda, automated by Terraform.

## Requirements
* [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)

* [python +3.9](https://www.python.org/downloads/)

* [aws-vault](https://github.com/99designs/aws-vault)

* [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) and IAM credentials

* [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

* [terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/)

## Lambda Functions on AWS
Basic setup:
* Python code:
  * simple code on aws-console or a zip file uploaded to S3 for bigger apps
  * every library outside the standard library must be included in the zip file
  * you need a handler for Lambda, in this case we use Mangum
* API gateway to trigger the lambda function
  * gateway URL used as a proxy to pass requests to the app router
  * permissions for gateway: in this case will be public.

***
## Deploys the project

1. Replaces **/src** with the code of your Python App
2. Downdloads required packages
```sh
make install
```
3. Creates a bucket to store state files (`demo-lambda-tfstate`). The bucket name is specify in `env/dev/terrgrunt.hcl` line 46.
4. Creates a DynamoDB table named `terraform-state-lock-dynamo` with hash key is `LockID` and type `S`
5. Deploys (`dev` environment):
```sh
cd ./env/dev/ap-southeast-1
terragrunt run-all apply
```
6. Gets base url to access api gateway
![Base URL](/images/api_gateway_base_url.png)

## Tests

1. Triggers `login` api
```curl
curl --location --request GET 'https://o8fd5nimq0.execute-api.ap-southeast-1.amazonaws.com/dev/users/login'
```

2. Triggers `register` api
```curl
curl --location --request POST 'https://o8fd5nimq0.execute-api.ap-southeast-1.amazonaws.com/dev/users/register' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name": "John"
}'
```

***
## Terraform secrets

Terraform will require the following variables to plan and apply:

```hcl
AWS_ACCESS_KEY_ID             # AWS access key associated with an IAM user or role.
AWS_SECRET_ACCESS_KEY         # Secret key associated with the access key. This is essentially the "password" for the access key
AWS_SESSION_TOKEN             # Token value that is required if you are using temporary security credentials that you retrieved directly from AWS STS operations
```
