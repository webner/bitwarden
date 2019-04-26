ARG CORE_VERSION=1.24.0
FROM bitwarden/setup:$CORE_VERSION

RUN mkdir -p /bitwarden/env/ && chmod -R a=u /bitwarden/env
COPY ./entrypoint.sh /entrypoint.sh

USER 65534
