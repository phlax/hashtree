#!/bin/sh


ls /tmp/dist

apt update
apt install  -y -qq --no-install-recommends /tmp/dist/hashtree_*deb
# -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
echo "FINISHED INSTALLING HASHTREE!"


exec ${@}
