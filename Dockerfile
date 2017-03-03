FROM redis:3.2.8-alpine

RUN apk update \ 
    && apk add tzdata \
    && /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
    && echo 'Asia/Shanghai' > /etc/timezone\
    && rm -fr /var/cache/apk/\
    #&& echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf\
    #&& echo 511 >> /proc/sys/net/core/somaxconn \
    #&& echo "echo never > /sys/kernel/mm/transparent_hugepage/enabled" >> /etc/rc.local
COPY init.sh /usr/local/bin/
ENTRYPOINT["init.sh"]
