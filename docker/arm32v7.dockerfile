FROM alpine AS builder

# Download QEMU, see https://github.com/docker/hub-feedback/issues/1261
ENV QEMU_URL https://github.com/balena-io/qemu/releases/download/v6.0.0%2Bbalena1/qemu-6.0.0.balena1-arm.tar.gz
RUN apk add curl && curl -L ${QEMU_URL} | tar zxvf - -C . --strip-components 1

FROM arm32v7/alpine:latest

# Add QEMU
COPY --from=builder qemu-arm-static /usr/bin

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
