import os
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    try:
        logger.info('lambda_handler is triggered with event: %s', event)
        json_region = os.environ['AWS_REGION']
        body = json.loads(event['body'])

        return {
            "statusCode": 200,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps({
                "region ": json_region,
                "message": "Register function triggered",
                "data": body
            })
        }
    except Exception as e:
        logger.error(e)
        return {
            "statusCode": 500,
            "headers": {
                "Content-Type": "application/json"
            },
            "body": json.dumps({
                "message": "Error",
            })
        }
