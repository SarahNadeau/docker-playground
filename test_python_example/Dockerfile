FROM ubuntu:xenial as build

# Update package index
RUN apt-get update && apt-get upgrade

# Install any old python
RUN apt-get install -y python3

# Copy in test code
# TODO: make the tests actually test the app
COPY tests/ .
COPY app/ .

# Run tests
RUN python3 -m unittest

# Build app now that tests have passed, keep container light by excluding tests
FROM ubuntu:xenial as app

RUN apt-get update && apt-get upgrade

RUN apt-get install -y python3

COPY app/ .

# Running the container runs the app
CMD python3 main.py

