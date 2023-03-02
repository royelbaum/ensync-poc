FROM docker.ouroath.com:4443/containers/sia-eks:latest
COPY ./siad /usr/sbin/siad
COPY ./copyScript.sh /tmp/copyScript.sh
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"