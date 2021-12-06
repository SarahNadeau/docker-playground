FROM ubuntu:xenial

# ARG variables only persist during build time
ARG PYTHON_VER="3.6.14"

# Update package index, install packages
RUN apt-get update && apt-get upgrade

# Install python & dependencies (thanks https://realpython.com/installing-python/#how-to-install-python-on-linux)
RUN apt-get install -y \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    llvm \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev

RUN wget https://www.python.org/ftp/python/$PYTHON_VER/Python-$PYTHON_VER.tgz
RUN tar xvf Python-$PYTHON_VER.tgz && rm Python-$PYTHON_VER.tgz
WORKDIR "/Python-$PYTHON_VER"
RUN ./configure && make && make install

# Show that python3 and pip3 are installed
CMD python3 --version; pip3 --version


