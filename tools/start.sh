#! /bin/bash

# /opt/dst_server/bin64/dontstarve_dedicated_server_nullrenderer_x64
echo 'ready to start dst server'

cd /opt/dst_server/bin64

./dontstarve_dedicated_server_nullrenderer_x64 -persistent_storage_root /data -monitor_parent_process $$ -cluster Cluster_1 -shard Master | sed 's/^/Master: /' &
./dontstarve_dedicated_server_nullrenderer_x64 -persistent_storage_root /data -monitor_parent_process $$ -cluster Cluster_1 -shard Caves | sed 's/^/Cave: /'