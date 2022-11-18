/interface/bridge/add name=dockers
/ip/address/add address=172.20.0.254/24 interface=dockers

/interface/veth/add name=veth53 address=172.20.0.53/24 gateway=172.20.0.254
/interface/bridge/port add bridge=dockers interface=veth53

/container/config/set registry-url=https://registry-1.docker.io tmpdir=disk1/pull

/container/envs/add name=unbound_envs key=TZ value="Asia/Jerusalem"

/container/add dns=172.20.0.254 remote-image=elicro/unbound:latest interface=veth53 root-dir=disk1/unbound envlist=unbound_envs start-on-boot=yes

