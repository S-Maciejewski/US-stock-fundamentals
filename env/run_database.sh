#!/bin/bash

docker run --name us-stock-db -d -p 5432:5432 us_stock_fundamentals_db:latest