ARG UBUNTU_VERSION=22.04
ARG IMAGE=ubuntu:$UBUNTU_VERSION

FROM $IMAGE

WORKDIR /app

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    cmake \
    gcc \
    g++ \
    clang \
    gcovr \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . /app
RUN gcc /app/test.c -o /bin/test-bin
ENTRYPOINT ["/bin/test-bin"]
