FROM quay.io/eduk8s/base-environment:201203.020609.1ab533d

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

RUN fix-permissions /home/eduk8s

# RUN wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add - && \
#     echo "deb https://releases.jfrog.io/artifactory/jfrog-debs xenial contrib" | sudo tee -a /etc/apt/sources.list && \
#     sudo apt update && \
#     sudo apt install -y jfrog-cli
RUN curl -fL https://getcli.jfrog.io | sh

RUN ls -la 