package main

import (
	"context"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

func main() {
	lambda.Start(handler)
}

func handler(ctx context.Context, sqsEvent events.SQSEvent) error {
	for _, msg := range sqsEvent.Records {
		fmt.Printf("Got SQS message %s with body: %s\n", msg.MessageId, msg.Body)
	}
	return nil
}
