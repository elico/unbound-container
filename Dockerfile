FROM alpine:latest

ARG TARGETOS
ARG TARGETARCH

RUN apk update && apk add --no-cache unbound wget && rm -vrf /var/cache/apk/* && \
	wget -S -N https://www.internic.net/domain/named.cache -O /etc/unbound/root.hints

ADD init.sh /init.sh

EXPOSE 53 53/udp

VOLUME [ "/etc/unbound" ]

ENTRYPOINT [ "/init.sh" ]
