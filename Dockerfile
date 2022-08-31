FROM ubuntu:16.04

ARG LANG=C.UTF-8
ARG LC_ALL=C.UTF-8
ARG USER_DIR=/data
ARG STEAM_DIR=/opt/steam
ARG STEAM_PATH=${STEAM_DIR}/steamcmd.sh
ARG DST_DIR=/opt/dst_server
ARG DST_PATH=${DST_DIR}/bin64/dontstarve_dedicated_server_nullrenderer_x64


RUN sed -i "s@http://.*archive.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list \
    && sed -i "s@http://.*security.ubuntu.com@http://repo.huaweicloud.com@g" /etc/apt/sources.list

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends lib32gcc1 libcurl4-gnutls-dev wget ca-certificates tar \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* 

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /tmp/steamcmd.tar.gz \
    && mkdir -p /opt/steam \
    && tar -zxvf /tmp/steamcmd.tar.gz -C ${STEAM_DIR} \
    && rm -rf /tmp/*

RUN mkdir ${USER_DIR} \
    && mkdir -p /opt/dst_server \
    && ${STEAM_PATH} +force_install_dir /opt/dst_server +login anonymous +app_update 343050 validate +quit



COPY Cluster_1 /data/DoNotStarveTogether/Cluster_1/

WORKDIR /root
COPY tools /root/tools/
RUN chmod 777 /root/tools/*.sh


VOLUME [ "${USER_DIR}" ]

ENV STEAM_DIR=${STEAM_DIR}
ENV DST_DIR=${DST_DIR}
ENV USER_DIR=${USER_DIR}

EXPOSE 10998/udp 10999/udp 12346/udp 12347/udp

ENTRYPOINT [ "/root/tools/entrypoint.sh" ]