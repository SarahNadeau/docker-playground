FROM ubuntu:18.04

# Update package index, install packages
RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

# Show that python3 and pip3 are intalled
CMD python3 --version; pip3 --version

