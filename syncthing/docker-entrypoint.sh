#!/usr/bin/env sh

set -e

config_count () {
    return $(xmlstarlet sel -t -v "count($2)" $1)
}

config_del () {
    xmlstarlet ed -O -L -d $2 $1
}

config_set () {
    if [ -z $3 ]; then
        config_del $1 $2
        return
    fi

    if config_count $1 $2; then
        local xpath
        local name
        local type
        xpath=$(dirname $2)
        name=$(basename $2)
        if echo $name | egrep -q "^@.*"; then
            type=attr
            name=${name:1}
        else
            type=elem
        fi
        xmlstarlet ed -O -L -s $xpath -t $type -n $name -v $3 $1
    else
        xmlstarlet ed -O -L -u $2 -v $3 $1
    fi
}


CONFIG_DIR="/config"
CONFIG_FILE="${CONFIG_DIR}/config.xml"
LISTEN_PORT=${LISTEN_PORT:-22000}

if [ ! -f ${CONFIG_FILE} ]; then /syncthing/syncthing -generate=${CONFIG_DIR}; fi

config_set ${CONFIG_FILE} "//configuration/options/defaultFolderPath" "/data"
config_set ${CONFIG_FILE} "//configuration/options/startBrowser" "false"
config_set ${CONFIG_FILE} "//configuration/options/listenAddress" "tcp://:${LISTEN_PORT}"

exec "$@"
