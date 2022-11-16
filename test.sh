#!/bin/bash

oapi-codegen -package ps petstore-expanded.yaml \
    | ./getspec.sh | grep -q 'PetExtra description' || echo '[1] PetExtra not defined'

oapi-codegen -config "oapi.configs/petstore.path.config.yaml" "paths/petstore.path.yaml" \
    | ./getspec.sh | grep -q 'PetExtra description' || echo '[2] PetExtra not defined'
