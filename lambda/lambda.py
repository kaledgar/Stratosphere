import json
import os
from typing import Dict, Any

import boto3
import datetime

EXPECTED_S3_KEYS = ["file.json"]

# Fetch AWS region and project prefix from environment variables
aws_region = os.environ["REGION"]
project_prefix = os.environ["PROJECT_PREFIX"]


def lambda_handler(event: Dict, context: Any):
    """Lambda function handler to process S3 events.

    Args:
        event (Dict): AWS Lambda event.
        context (Any): AWS Lambda context.
    """
    # Extract S3 bucket and key from the event
    inc_bucket, inc_key = parse_s3_event(event)

    # Check if the file is expected
    if inspect_file(file_name=inc_key):
        print(f"File {inc_key} found in {inc_bucket}!")


def parse_s3_event(event: Dict) -> tuple:
    """Extract S3 bucket and key from AWS S3 event.

    Args:
        event (Dict): AWS S3 event.

    Returns:
        tuple: (bucket, key)
    """
    bucket = event["Records"][0]["s3"]["bucket"]["name"]
    key = event["Records"][0]["s3"]["object"]["key"]
    return bucket, key


def inspect_file(file_name: str, allowed_keys: list = EXPECTED_S3_KEYS) -> bool:
    """Check if the file is expected.

    Args:
        file_name (str): Name of the file.
        allowed_keys (list): List of allowed file names.

    Returns:
        bool: True if the file is expected, False otherwise.
    """
    return file_name in allowed_keys
