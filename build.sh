#!/bin/sh

FILES='oraclejdk8 oraclejdk8_maven wildfly'

for name in $FILES; do
	echo "Building $name."
    docker build -t $name - < Dockerfile."$name"
    echo "Done $name."
done