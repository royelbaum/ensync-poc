FROM docker.ouroath.com:4443/yahoo/ubi7/ubi

RUN yum-config-manager \
  --add-repo https://edge.artifactory.ouroath.com:4443/artifactory/athens_rpms/athens_rpms.repo \
  --add-repo https://edge.artifactory.ouroath.com:4443/artifactory/oath-rpms/oath-rpms-stable.repo; \
  yum install -y \
    --enablerepo athens_rpms,oath-rpms \
    sshca-creds sshca-sshd-components sshok --nogpgcheck

RUN yum install -y https://artifactory.ouroath.com/artifactory/athens_rpms/rhel/7Server/beta/x86_64/Packages/calypso-svc-1.15-39.el7_9.x86_64.rpm
RUN yum install -y openssh-server lsof git bind-utils traceroute

RUN ssh -V \
  git --version \
  curl --version

WORKDIR /usr/tmp
COPY ./copyScript.sh /tmp/copyScript.sh
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"