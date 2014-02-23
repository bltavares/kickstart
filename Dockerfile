FROM ubuntu:12.04

MAINTAINER Bruno Tavares <@bltavares>

ADD . /opt/kickstart
RUN ln -s /opt/kickstart/bin/kickstart /usr/local/bin/kickstart
RUN echo 'eval "$(kickstart autocomplete)"' >> /etc/bash.bashrc

CMD 'bash'
