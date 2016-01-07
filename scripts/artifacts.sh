#!/bin/bash

function get_artifact {
    REPOSITORY=$1
    GROUP=$2
    ARTIFACT=$3
    VERSION=$4
    PACKAGING=$5
    FILENAME=${6:-${ARTIFACT}-${VERSION}.${PACKAGING}}

    NEXUS_BASE_URL=https://maven.lib.umd.edu/nexus/service/local/artifact/maven/content
    NEXUS_URL="$NEXUS_BASE_URL?r=$REPOSITORY&g=$GROUP&a=$ARTIFACT&v=$VERSION&p=$PACKAGING"

    if [ ! -e "$FILENAME" ]; then
        curl "$NEXUS_URL" > "$FILENAME"
    fi
}


cd /apps/dist

get_artifact releases edu.umd.lib optional-authn-valve 1.0.0 jar
get_artifact snapshots edu.umd.lib fcrepo-user-webapp LATEST war user.war

#TODO: get fcrepo.war
