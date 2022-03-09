FROM alpine
MAINTAINER Rustam Sharipov <keoroot@gmail.com>
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_386.zip && \
    unzip /tmp/terraform.zip -d / 
RUN apk add --no-cache ca-certificates curl
USER root
ENTRYPOINT [ "/terraform" ]