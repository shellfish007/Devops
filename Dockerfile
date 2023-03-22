FROM jenkins/jenkins:lts
COPY . .

USER root

# Install sudo and add a user with sudo privileges
RUN apt-get update && \
    apt-get -y install sudo && \
    adduser jenkins sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER jenkins
