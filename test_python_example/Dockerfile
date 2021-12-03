FROM ubuntu:xenial

# Update package index
RUN apt-get update && apt-get upgrade

# Install any old python
RUN apt-get install -y python3

# Copy in test code
COPY tests/ .g

# Run test
RUN python3 -m unittest
