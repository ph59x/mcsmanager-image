FROM node:20-alpine

RUN apk --no-cache add wget && \ 
    mkdir -p /opt/mcsmanager && cd /opt/mcsmanager && \
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz && \
    tar -zxf mcsmanager_linux_release.tar.gz && \
    cd ./daemon && \
    npm install --omit=dev && \
    npm cache clean --force && \ 
    cd ../ && \
    rm ./mcsmanager_linux_release.tar.gz ./*.sh ./*.md && \
    rm -rf ./web && \
    apk del wget && \
    mkdir -p ./daemon/data 

ENV TZ=Asia/Shanghai

VOLUME [ "/var/run/docker.sock" ]
VOLUME [ "/opt/mcsmanager/daemon/data" ]

EXPOSE 24444

WORKDIR /opt/mcsmanager/daemon

ENTRYPOINT [ "node", "app.js" ]
