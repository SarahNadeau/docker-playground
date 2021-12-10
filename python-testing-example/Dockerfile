FROM ubuntu:xenial as base

# Update package index
RUN apt-get update && apt-get upgrade

# Install any old python
RUN apt-get install -y python3

# Copy in app code
COPY app/ .

# Build app now that tests have passed, keep container light by excluding tests
FROM base as app

# Running the container runs the app
CMD python3 main.py


FROM base as test

# Copy in test code
# TODO: make the tests actually test the app
COPY tests/ .

# Run tests
RUN python3 -m unittest

# Test with: docker build --target=test -t <image name> .
# Build with: docker build --target=app -t <image name> .
# Run with: docker run <image name>

