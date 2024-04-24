#!/bin/bash

GRPC_HOSTNAME=localhost
GRPC_PORT=8033

grpcurl -v \
	-plaintext \
	-proto ../generation.proto \
	-d '{
    "requests": [
      {
        "text": "At what temperature does Nitrogen boil?",
        "text": "another request"
      }
    ],
    "params": {
      "stopping": {
        "min_new_tokens": 10,
        "max_new_tokens": 100
      }
    }
  }' \
	"${GRPC_HOSTNAME}:${GRPC_PORT}" \
	fmaas.GenerationService/Generate
