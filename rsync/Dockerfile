FROM ghcr.io/ustcmirror-test/base:alpine-3.12 AS builder
RUN apk add --no-cache build-base
WORKDIR /tmp
ADD lchmod.c .
RUN gcc -Wall -fPIC -shared -o lchmod.so lchmod.c

FROM ghcr.io/ustcmirror-test/base:alpine-3.12
LABEL maintainer "Jian Zeng <anonymousknight96 AT gmail.com>"
RUN apk add --no-cache rsync openssh-client
ADD sync.sh /
COPY --from=builder /tmp/lchmod.so /usr/local/lib/lchmod.so
ENV LD_PRELOAD=/usr/local/lib/lchmod.so
