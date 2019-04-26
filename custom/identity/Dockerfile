ARG CORE_VERSION=1.24.0
FROM bitwarden/identity:$CORE_VERSION

RUN mkdir -p /etc/bitwarden/core && \
    mkdir -p /etc/bitwarden/identity && \
    mkdir -p /etc/bitwarden/logs && \
    mkdir -p /etc/bitwarden/ca-certificates && \
    chmod -R a=u /app && \
    chmod -R a=u /etc/bitwarden

COPY ./entrypoint.sh /entrypoint.sh
USER 65534
