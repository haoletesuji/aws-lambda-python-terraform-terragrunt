import os
import json
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)

def hello_handler(event, context):
    logger.info('lambda_handler is triggered with event: %s', event)
    json_region = os.environ['AWS_REGION']
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps({
            "region ": json_region,
            "message": "HaoLe"
        })
    }
