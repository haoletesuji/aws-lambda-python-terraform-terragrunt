import os


HEADERS = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "*",
    "Access-Control-Allow-Methods": "OPTIONS,POST,GET,PUT,PATCH,DELETE",
    "Access-Control-Allow-Credentials": True,
}


class NotFoundException(Exception):
    pass


def get_headers():
    """
    Get the headers to add to response data
    """
    headers = HEADERS

    return headers
