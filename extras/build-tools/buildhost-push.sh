#!/bin/bash

remote_host=${1}
remote_user=root
local_base_path=$(realpath $(dirname $(realpath $0))/../../)

if [ -z ${remote_host} ]; then
    echo 'usage: '$0' <host-address>'
    exit 1
fi

PORTNAME=pfSense-pkg-FauxAPI
STAGEDIR=$remote_user@$remote_host:/

rsync -rv --delete ${local_base_path}/${PORTNAME}/ ${STAGEDIR}/usr/ports/sysutils/${PORTNAME}
