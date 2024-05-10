FROM scratch AS builder

ADD alpine-minirootfs-3.19.1-aarch64.tar /

ARG VERSION

WORKDIR /usr/app

RUN apk update && apk add nodejs npm

COPY ./src/package.json ./

RUN npm install

COPY ./src/server.js ./


FROM alpine:latest

ARG VERSION

ENV APP_VERSION=${VERSION:-1.0.0}

COPY --from=builder /usr/app /usr/app

RUN apk update && apk add nodejs 

WORKDIR /usr/app

EXPOSE 81

CMD node server.js  

HEALTHCHECK --interval=15s --timeout=5s --start-period=5s --retries=5 \
    CMD wget -q --spider http://localhost:3000 || exit 1

