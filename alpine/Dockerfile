FROM alpine:3.14

RUN apk update && apk upgrade && apk add nodejs npm

COPY ./package.json ./
RUN npm install