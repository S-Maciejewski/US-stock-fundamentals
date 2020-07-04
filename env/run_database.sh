#!/bin/bash

docker run --name us-stock-db -d -e POSTGRES_PASSWORD=pwd -p 5432:5432 postgres:latest