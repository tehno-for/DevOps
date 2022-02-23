FROM alpine
LABEL maintainer="Carlos Nunez <dev@carlosnunez.me>"
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.14.8/terraform_0.14.8_linux_amd64.zip
RUN cd /tmp && unzip terraform.zip && mv terraform /
USER nobody
ENTRYPOINT [ "/terraform" ]
