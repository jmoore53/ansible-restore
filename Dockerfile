FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y --no-install-recommends \
    software-properties-common \
    git \
    restic

RUN add-apt-repository --yes --update ppa:ansible/ansible
RUN apt update
RUN apt upgrade -y
RUN apt install ansible -y
RUN restic self-update

RUN mkdir /restic

COPY ./ /restic

WORKDIR /restic

CMD ["ansible-playbook", "main.yml", "--ask-vault-password"]

