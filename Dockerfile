FROM redis:3.2.8-alpine

RUN apk update \ 
    && apk add tzdata \
    && /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime\
    && echo 'Asia/Shanghai' > /etc/timezone\
    && rm -fr /var/cache/apk/ \
    && echo "vm.overcommit_memory=1" >> /etc/sysctl.conf\
    && echo net.core.somaxconn=511 >> /etc/sysctl.conf
    #&& echo never > /sys/kernel/mm/transparent_hugepage/enabled\

    
    
