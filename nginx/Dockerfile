#image
FROM nginx:latest

#build time variables

ARG APP_USER=nginx
ARG APP_GROUP=nginx
ARG APP_ROOT=/nginx


# for setup 
USER root

#copying content
RUN mkdir "$APP_ROOT"
COPY nginx.conf run.sh "$APP_ROOT"/

#debugging
RUN ls /etc/nginx -l

#changing default config files to our config
RUN rm /etc/nginx/conf.d/default.conf && \
    mkdir /etc/nginx/logs && \
    mkdir /etc/nginx/ssl && \
    mkdir /etc/nginx/pages && \
    touch /var/run/nginx.pid && \
    mv "$APP_ROOT"/conf/nginx.conf /etc/nginx/nginx.conf

#modify file ownership for user as a security implementation
RUN chown -R "$APP_USER":"$APP_GROUP" "$APP_ROOT" && \
    chown -R "$APP_USER":"$APP_GROUP" /etc/nginx/* && \
    chown -R "$APP_USER":"$APP_GROUP" /var/cache/nginx && \
    chown -R "$APP_USER":"$APP_GROUP" /var/log/nginx && \
    chown -R "$APP_USER":"$APP_GROUP" /var/run/nginx.pid && \
    chmod +x "$APP_ROOT" /run.sh

#change user for nginx
USER "$APP_USER"

WORKDIR "$APP_ROOT"/

ENTRYPOINT ["./run.sh"]
