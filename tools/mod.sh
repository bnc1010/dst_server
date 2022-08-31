#! /bin/bash

echo 'try to make mods'
if [ ! -d ${USER_DIR}/mods ]; then
    echo 'user mods not exist, copy a default config to user dir'
    cp -r ${DST_DIR}/mods ${USER_DIR}/mods
else
    echo 'user mods exist, copy them to dst dir'
    rm -rf ${DST_DIR}/mods
    ln -s ${USER_DIR}/mods ${DST_DIR}/mods
fi

