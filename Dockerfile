# base
FROM ubuntu:18.04

# set the github cofig
ARG RUNNER_VERSION=""
ARG GITHUB_TOKEN=""
ARG GITHUB_PROJECT=""
ARG RUNNER_NAME=""
ARG RUNNER_WORKDIR=""
ARG RUNNER_GROUP="default"
ARG LABELS="docker,self-hosted,ubuntu"
ARG SSL_NO_VERIFY=0

ENV SSL_NO_VERIFY=${SSL_NO_VERIFY}

# update the base packages and add a non-sudo user
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y curl ca-certificates sudo \
    && useradd -m docker

# install git
RUN apt-get install -y git

# update /etc/ssl/certs and ca-certificates.crt
RUN update-ca-certificates

# change workdir
WORKDIR /home/docker/actions-runner

# cd into the user directory, download and unzip the github actions runner
RUN curl -O -L -k https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# install and del .tar.gz
RUN tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz && rm ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

# make the script executable
RUN chmod +x ./run.sh ./config.sh ./bin/installdependencies.sh && chmod 777 /home/docker/actions-runner

# install dependencies
RUN ./bin/installdependencies.sh

# since the config and run script for actions are not allowed to be run by root,
# set the user to "docker" so all subsequent commands are run as the docker user
USER docker

# # disable SSL and set config
RUN export GITHUB_ACTIONS_RUNNER_TLS_NO_VERIFY=${SSL_NO_VERIFY} \
    && ./config.sh \
        --url ${GITHUB_PROJECT} \
        --token ${GITHUB_TOKEN} \
        --name ${RUNNER_NAME} \
        --labels ${LABELS} \
        --work ${RUNNER_WORKDIR} \
        --runnergroup ${RUNNER_GROUP}

# # set the entrypoint to the start.sh script
ENTRYPOINT export GITHUB_ACTIONS_RUNNER_TLS_NO_VERIFY=${SSL_NO_VERIFY} && ./run.sh
