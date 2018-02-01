FROM linuxserver/radarr:latest

RUN \
    echo "**** install packages ****" && \
    apt-get update && \
    apt-get install -y \
        xmlstarlet && \
    echo "**** cleanup ****" && \
    apt-get clean && \
    rm -rf \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*

COPY root/ /
