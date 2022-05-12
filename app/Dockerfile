FROM python:3.9-slim

# Variables
ARG APP_USER=app
ARG APP_GROUP=app
ARG APP_ROOT=/app

# for setup 
USER root

# copying content, only requirements.txt is needed
RUN mkdir -p "$APP_ROOT"/src
COPY src/ "$APP_ROOT"/src
COPY run.sh "$APP_ROOT"/


# Installing python packages
RUN apt-get update && \
    pip install --upgrade pip

RUN cat "$APP_ROOT"/src/requirements.txt

RUN pip install --upgrade -r "$APP_ROOT"/src/requirements.txt

#debuggin
RUN ls "$APP_ROOT"/src -l

#creating new user-group and adding new user
RUN groupadd "$APP_GROUP" && \
    useradd -g "$APP_GROUP" "$APP_USER" && \
    mkdir /home/"$APP_USER" && \
    chown -R "$APP_USER":"$APP_GROUP" /home/"$APP_USER"

#modify file ownership for user as a security implementation
RUN chown -R "$APP_USER":"$APP_GROUP" "$APP_ROOT" && \
    chmod +x "$APP_ROOT"/run.sh

#exposing the flask app to the nginx
EXPOSE ${FLASK_APP_PORT}

#chnging user and working directiories
USER "$APP_USER"
WORKDIR "$APP_ROOT"/

ENTRYPOINT [ "./run.sh" ]