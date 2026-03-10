FROM alpine:latest

ENV UUID=19800000-0000-0000-0000-000000000000
ENV WSPATH=/video

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
    && mkdir -p /usr/bin/xray \
    && curl -L -H "Cache-Control: no-cache" -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /usr/bin/xray \
    && chmod +x /usr/bin/xray/xray \
    && rm -rf /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["/usr/bin/xray/xray", "-config", "/etc/xray/config.json"]
