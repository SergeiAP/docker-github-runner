# docker-github-runner
The project for creating github-runner in docker

To run your own [self-hosted](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners) **github-runner in docker**: 
1. Install [docker](https://docs.docker.com/engine/install/ubuntu/)
2. Copy and reanme `docker.env.example` into `docker.env`
3. Fill variables for your `github-runner`:
```bash
RUNNER_VERSION=   # version of the runner, e.g. _2.293.0_ (see [here](https://github.com/actions/runner))
GITHUB_TOKEN=     # token for identify your runner (more [info](https://docs.github.com/en/actions/hosting-your-own-runners/adding-self-hosted-runners))
GITHUB_PROJECT=   # project link, e.g. _https://github.com/SergeiAP/windmill_power_prediction_
RUNNER_NAME=      # name of the runner
RUNNER_WORKDIR=   # workdir inside of the docker to store and run code pushed to runner, e.g. _/tmp/runner/work_
RUNNER_GROUP=     # runner group, if you use free version use _default_
LABELS=           # labels to identify your runner in CICD .yaml file
SSL_NO_VERIFY=    # verify or not SSL, type _1_ - no verify or _0_ -verify
IMAGE_NAME=       # name of creating docker image
CONTAINER_NAME=   # name of creating docker container
DOCKER_NETWORK=   # docker netwrok (if required), for `set_docker_network.sh` parameter is required.
                  # If it is not required - use `build_run_docker.sh` only or use speciifc commands in `Makefile`
```
4. Run `build_run_docker.sh` to build image and run container  (and `set_docker_network.sh` for set network) OR use commands in __Makefile__ (what is [Makefile](https://opensource.com/article/18/8/what-how-makefile)) for it

**Enjoy!**
