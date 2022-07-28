#!/bin/sh

docker build -t gcp . && docker run -p 9191:8080 gcp