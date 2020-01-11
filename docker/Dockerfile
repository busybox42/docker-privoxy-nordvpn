FROM alpine:latest

EXPOSE 8118

RUN apk --update --no-cache add privoxy openvpn runit 

COPY app /app

RUN find /app -name run | xargs chmod u+x

ENV REGION="us1742" \
    PROTOCOL="tcp" \
    USERNAME="null" \
    PASSWORD="null" \
    LOCAL_NETWORK=10.10.4.0/24

CMD ["runsvdir", "/app"]
