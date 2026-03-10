FROM alpine:latest

ENV UUID=32022199-1314-5240-9999-108113106214
ENV WSPATH=/cjwxt

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
    && mkdir -p /usr/bin/xray \
    && curl -L -H "Cache-Control: no-cache" -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /usr/bin/xray \
    && chmod +x /usr/bin/xray/xray \
    && rm -rf /tmp/xray.zip

COPY config.json /etc/xray/config.json

EXPOSE 8080

CMD ["/usr/bin/xray/xray", "-config", "/etc/xray/config.json"]
