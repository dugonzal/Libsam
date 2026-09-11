ARG UBUNTU_VERSION=22.04
FROM ubuntu:${UBUNTU_VERSION}

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
	&& apt-get install -y --no-install-recommends nasm clang gcc binutils make \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /libsam
COPY . .

RUN make && make run

CMD ["make", "run"]
