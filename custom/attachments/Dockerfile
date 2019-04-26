ARG CORE_VERSION=1.24.0
FROM bitwarden/attachments:$CORE_VERSION


RUN mkdir -p /etc/bitwarden/core/attachments && \
    chmod -R a=u /bitwarden_server && \
    chmod -R a=u /etc/bitwarden

COPY ./entrypoint.sh /entrypoint.sh
USER 65534
