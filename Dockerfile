# Container image that runs your code
FROM alpine:3.20

# Install dependencies
RUN apk --no-cache add lftp libsass curl tar

# Install Zola from official releases
ARG ZOLA_VERSION=0.21.0
RUN curl -L "https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-musl.tar.gz" | tar xz -C /usr/local/bin

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
