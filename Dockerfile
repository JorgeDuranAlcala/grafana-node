FROM alpine:3.14

RUN apk update && apk upgrade && apk add nodejs npm grafana

COPY ./package.json ./
RUN npm install

COPY ./logs ./logs

COPY ./index.html ./index.html
COPY ./index.js ./index.js

CMD ["npm", "start"]

FROM grafana/grafana-oss

ENV GF_SECURITY_ALLOW_EMBEDDING=true
ENV GF_SECURITY_COOKIE_SAMESITE=none
