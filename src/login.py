import os
import json
import logging
from layers import shared

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info('lambda_handler is triggered with event: %s', event)
    json_region = os.environ['AWS_REGION']
    return {
        "statusCode": 200,
        "headers": shared.get_headers(),
        "body": json.dumps({
            "region ": json_region,
            "message": "Login function triggered"
        })
    }
