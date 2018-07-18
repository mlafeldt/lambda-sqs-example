# Lambda SQS Example using Serverless Framework and Go

As of June 2018, it's possible to use Amazon SQS to trigger AWS Lambda functions.

This sample project demonstrates how to use this feature with the Serverless Framework and Go.

## Usage

```console
make deploy

echo '{"Records":[{"messageID":"1","body":"Hello"},{"messageID":"2","body":"World"}]}' | sls invoke -f worker

sls logs -f worker
```

Which should output something like this:

```
START RequestId: bdf5c92f-8a6d-11e8-ad3a-f1cb42f29439 Version: $LATEST
Got SQS message "1" with body "Hello"
Got SQS message "2" with body "World"
END RequestId: bdf5c92f-8a6d-11e8-ad3a-f1cb42f29439
```

## Resources

- https://aws.amazon.com/blogs/aws/aws-lambda-adds-amazon-simple-queue-service-to-supported-event-sources/
- https://github.com/aws/aws-lambda-go/commit/02a038f1708ade8d5fd6a28ee309c388008fe770
- https://serverless.com/blog/aws-lambda-sqs-serverless-integration/
