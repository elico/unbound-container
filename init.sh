#!/usr/bin/env sh

#!/usr/bin/env sh

sed -i -e "s@# use-syslog: yes@use-syslog: no@g" /etc/unbound/unbound.conf

sed -i -e "s@# root-hints:.*@root-hints: \"/etc/unbound/root.hints\"@g" /etc/unbound/unbound.conf

sed -i -e "s@# access-control: 0.0.0.0/0 refuse@access-control: 0.0.0.0/0 allow@g" /etc/unbound/unbound.conf

sed -i -e "s@# do-daemonize: yes@do-daemonize: no@g" /etc/unbound/unbound.conf

sed -i -e "s@# minimal-responses: yes@minimal-responses: no@g" /etc/unbound/unbound.conf

sed -i -e "s@# prefetch: no@prefetch: yes@g" /etc/unbound/unbound.conf

sed -i -e "s@# interface: 192.0.2.153@interface: 0.0.0.0@g" /etc/unbound/unbound.conf

unbound-checkconf
unbound -d
