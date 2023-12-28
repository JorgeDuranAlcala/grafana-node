FROM node:alpine as builder

WORKDIR /app

COPY ./package.json ./
RUN npm install

COPY ./logs ./logs

COPY ./index.html ./index.html
COPY ./index.js ./index.js

CMD ["npm", "start"]

FROM grafana/grafana-enterprise

COPY --from=builder /app/logs /tmp/logs
