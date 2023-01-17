import os
import json
import logging
import requests
from shared import header

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info('lambda_handler is triggered with event: %s', event)
    json_region = os.environ['AWS_REGION']
    x = requests.get('https://w3schools.com/python/demopage.htm')

    return {
        "statusCode": 200,
        "headers": header.get_headers(),
        "body": json.dumps({
            "x": x.text,
            "region ": json_region,
            "message": "Login function triggered"
        })
    }
