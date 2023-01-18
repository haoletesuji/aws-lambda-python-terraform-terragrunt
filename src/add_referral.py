from aws_lambda_powertools import Logger


logger = Logger()


@logger.inject_lambda_context
def lambda_handler(event, context):
    logger.info('lambda_handler is triggered with event: %s', event)

    return {
        "is_refferall_added": True
    }
