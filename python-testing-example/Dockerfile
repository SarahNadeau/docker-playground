FROM ubuntu:xenial as base

# Update package index
RUN apt-get update && apt-get upgrade

# Install any old python
RUN apt-get install -y python3

# Copy in app code
COPY app/ .

# App stage is the production stage
FROM base as app

# Running the container runs the app
CMD python3 main.py


# Test stage is built on top of the app, runs tests on it
FROM app as test

# Copy in test code
RUN mkdir tests/
COPY tests/ tests/

# Run app
RUN python3 main.py

# Run tests on app output
RUN python3 -m unittest discover -s tests

# Test with: docker build --progress=plain --target=test -t <image name> .
# Build with: docker build --target=app -t <image name> .
# Run with: docker run <image name>

