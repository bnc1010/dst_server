cmdDir=${STEAM_DIR}
dstDir=${DST_DIR}

"$cmdDir"/steamcmd.sh \
    +force_install_dir "$dstDir" \
    +login anonymous \
    +app_update 343050 validate  \
    +quit