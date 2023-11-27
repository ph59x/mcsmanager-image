FROM node:20-alpine

RUN apk --no-cache add git && git clone https://github.com/pH59x/MCSManager-Web-Production /opt/mcsmanager/web --depth=1 && cd /opt/mcsmanager/web && npm install --omit=dev && npm cache clean --force && apk del git && mkdir -p /opt/mcsmanager/web/data

ENV TZ=Asia/Shanghai

VOLUME [ "/opt/mcsmanager/web/data" ]

EXPOSE 23333

WORKDIR /opt/mcsmanager/web

ENTRYPOINT [ "node", "app.js" ]
