FROM base-image:v1

ENV PASSWD=123456

ENV OSS_URL http://oss-cn-beijing-internal.aliyuncs.com
ENV OSS_BUCKET bucket-name
ENV OSSFS_OPTIONS -o allow_other -o umask=777
ENV MNT_POINT /share/oss
ENV ACCESS_KEY changeme
ENV ACCESS_SECRET changeme

RUN yum -y install passwd openssl openssh-server net-tools wget vim

RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''\
    && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''

RUN sed -i 's/#PermitRootLogin/PermitRootLogin/g' /etc/ssh/sshd_config \
    && echo $PASSWD | passwd --stdin root \
    && echo "export PATH=$PATH:\$PATH" >> /etc/bashrc

ADD http://gosspublic.alicdn.com/ossfs/ossfs_1.80.6_centos7.0_x86_64.rpm .
RUN yum -y install ossfs_1.80.6_centos7.0_x86_64.rpm \
    && rm ossfs_1.80.6_centos7.0_x86_64.rpm

COPY mountAndsshd.sh /usr/sbin/mountAndsshd.sh

CMD ["/bin/sh", "/usr/sbin/mountAndsshd.sh"]

