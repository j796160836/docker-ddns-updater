FROM node:9.11.1-alpine

ADD "my-ddns" "/opt/my-ddns"

WORKDIR "/opt/my-ddns"

RUN npm install

CMD ["/bin/sh", "-c", "npm start"]