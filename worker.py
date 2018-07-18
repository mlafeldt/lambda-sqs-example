import json
import logging

log = logging.getLogger()
log.setLevel(logging.INFO)


def handler(event, context):
    log.info("Received event {}".format(json.dumps(event)))
