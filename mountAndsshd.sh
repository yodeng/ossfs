#!/bin/sh
echo ${OSS_BUCKET}:${ACCESS_KEY}:${ACCESS_SECRET} > /etc/passwd-ossfs
chmod 600 /etc/passwd-ossfs
mkdir -p ${MNT_POINT}
ossfs ${OSS_BUCKET} ${MNT_POINT} -ourl=${OSS_URL} ${OSSFS_OPTIONS}
#/usr/sbin/init
/usr/sbin/sshd -D
