#! /bin/bash


if [ ! -d ${USER_DIR}/DoNotStarveTogether ]; then
    echo "you need put the dst files in mounted path"
fi

# update before open the server
/root/tools/update.sh

# add mods
/root/tools/mod.sh

# start server
/root/tools/start.sh