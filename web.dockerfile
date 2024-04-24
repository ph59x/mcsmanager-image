FROM node:20-alpine

RUN apk --no-cache add wget && \ 
    mkdir -p /opt/mcsmanager && cd /opt/mcsmanager && \
    wget https://github.com/MCSManager/MCSManager/releases/latest/download/mcsmanager_linux_release.tar.gz && \
    tar -zxf mcsmanager_linux_release.tar.gz && \
    cd ./web && \
    npm install --omit=dev && \
    npm cache clean --force && \ 
    cd ../ && \
    rm ./mcsmanager_linux_release.tar.gz ./*.sh ./*.md && \
    rm -rf ./daemon && \
    apk del wget && \
    mkdir -p ./web/data 

ENV TZ=Asia/Shanghai

VOLUME [ "/opt/mcsmanager/web/data" ]

EXPOSE 23333

WORKDIR /opt/mcsmanager/web

ENTRYPOINT [ "node", "app.js" ]
