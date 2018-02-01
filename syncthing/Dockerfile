FROM syncthing/syncthing:latest

USER root

RUN apk --no-cache add xmlstarlet

USER syncthing

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/syncthing/syncthing", "-home", "/config", "-gui-address", "0.0.0.0:8384"]
