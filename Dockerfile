FROM alpine:3.20

ARG ZOLA_VERSION=0.22.0
ENV ZOLA_URL="https://github.com/getzola/zola/releases/download/v${ZOLA_VERSION}/zola-v${ZOLA_VERSION}-x86_64-unknown-linux-musl.tar.gz"

RUN echo "Downloading Zola from: ${ZOLA_URL}"
RUN apk --no-cache add --virtual .build-deps curl \
    && curl -fsSL "${ZOLA_URL}" | tar xz -C /usr/local/bin \
    && apk del .build-deps \
    && apk --no-cache add lftp libsass

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
