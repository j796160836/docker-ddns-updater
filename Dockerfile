FROM node:9.11.1-alpine

ADD "my-ddns" "/opt/my-ddns"

WORKDIR "/opt/my-ddns"

ARG user=myuser
ARG group=myuser
ARG uid=1001
ARG gid=1001

RUN addgroup -g ${gid} ${group} \
    && adduser -h "/opt/my-ddns" -u ${uid} -G ${group} -s /bin/sh -D ${user}

RUN apk update --no-cache; \
    apk add --no-cache ca-certificates; \
    npm install

USER ${user}

CMD ["/bin/sh", "-c", "npm start"]