FROM nginx:1.14

COPY nginx.conf /etc/nginx
COPY default.conf /etc/nginx/conf.d/default.conf

RUN chmod a=u /etc/nginx/conf.d/default.conf && \
    chmod a=u /var/cache/nginx && \
    chmod a=u /var/run/

COPY entrypoint.sh /entrypoint.sh
USER 65534
CMD ["/entrypoint.sh"]
