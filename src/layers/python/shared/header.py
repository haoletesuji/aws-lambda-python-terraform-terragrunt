HEADERS = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Headers": "*",
    "Access-Control-Allow-Methods": "OPTIONS,POST,GET,PUT,PATCH,DELETE",
    "Access-Control-Allow-Credentials": True,
    "Content-Type": "application/json",
    "Accept": "application/json"
}


def get_headers():
    """
    Get the headers to add to response data
    """

    return HEADERS
