FROM alpine
MAINTAINER Rustam Sharipov <keoroot@gmail.com>
<<<<<<< HEAD

RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_386.zip
RUN unzip /tmp/terraform.zip -d /
RUN apk add --no-cache ca-certificates curl

=======
RUN wget -O /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_386.zip && \
    unzip /tmp/terraform.zip -d / 
RUN apk add --no-cache ca-certificates curl
>>>>>>> 2d1ede7dec5d6279ec1301c4ce76551a0b744d90
USER root
ENTRYPOINT [ "/terraform" ]