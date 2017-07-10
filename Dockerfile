FROM python:2.7.13-alpine
WORKDIR /root

COPY start.sh /root/start.sh
RUN apk update && apk add git libffi libffi-dev gcc g++ make openssl-dev openssl openssh && \
    cd /root/ && git clone https://github.com/byt3bl33d3r/CrackMapExec && \
    cd /root/CrackMapExec && git submodule init && git submodule update --recursive && \
    python setup.py install &&  apk del git libffi-dev gcc g++ make openssl-dev && \
    rm -rf /var/cache/apk/*
CMD ["/bin/sh","/root/start.sh"]
