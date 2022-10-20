# Container image that runs your code
FROM alpine:3.16

RUN apk --no-cache add lftp libsass
Run apk --no-cache add zola --repository https://dl-cdn.alpinelinux.org/alpine/v3.16/community

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
