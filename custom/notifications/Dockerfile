ARG CORE_VERSION=1.39.4
FROM bitwarden/notifications:$CORE_VERSION


RUN mkdir -p /etc/bitwarden/core/attachments && \
    chmod -R a=u /app && \
    chmod -R a=u /etc/bitwarden

COPY ./entrypoint.sh /entrypoint.sh
USER 65534
