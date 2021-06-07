FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

RUN fix-permissions /home/eduk8s

RUN curl -fL https://getcli.jfrog.io | sh

RUN chmod 755 $HOME/jfrog 

ENV PATH="${PATH}:${HOME}"