ARG WEB_VERSION=2.3.0
FROM bitwarden/web:$WEB_VERSION

RUN mkdir /etc/bitwarden && \
    chmod -R a=u  /etc/bitwarden && \
    chmod -R a=u /app && \
    chmod -R a=u /bitwarden_server

COPY ./entrypoint.sh /entrypoint.sh
USER 65534
