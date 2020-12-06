
ARG IMAGE_GITLAB

FROM ${IMAGE_GITLAB}

ENV TERM=xterm \
    LANG=en_US.UTF-8 \
    LESS="-R -M -i --shift=1" \
    LESSCOLOR=always \
    force_color_prompt=yes

RUN echo 'en_US.UTF-8 UTF-8\nru_RU.UTF-8 UTF-8' | tee /etc/locale.gen

RUN sed -re 's/# (.*history-search-(backward|forward))/\1/' -i /etc/inputrc

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
#        binutils \
#        curl \
#        bind9-host \
#        dnsutils \
#        htop \
#        iproute2 \
#        iputils-ping \
        less \
        locales \
#        lsof \
#        mc \
#        strace \
#        tcpdump \
#        telnet \
        python-pip \
        file \
    && pip install \
        envdir==1.0.1

ADD .add/ /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/assets/wrapper"]
