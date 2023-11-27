FROM node:20-alpine

RUN apk --no-cache add git && git clone https://github.com/pH59x/MCSManager-Daemon-Production /opt/mcsmanager/daemon --depth=1 && cd /opt/mcsmanager/daemon && npm install --omit=dev && npm cache clean --force && apk del git && mkdir -p /opt/mcsmanager/daemon/data

ENV TZ=Asia/Shanghai

VOLUME [ "/var/run/docker.sock" ]
VOLUME [ "/opt/mcsmanager/daemon/data" ]

EXPOSE 24444

WORKDIR /opt/mcsmanager/daemon

ENTRYPOINT [ "node", "app.js" ]
