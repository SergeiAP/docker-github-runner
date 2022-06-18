# docker-github-runner
The project for creating github-runner in docker

To run your own [self-hosted](https://docs.github.com/en/actions/hosting-your-own-runners/about-self-hosted-runners) **github-runner in docker**: 
1. Install [docker](https://docs.docker.com/engine/install/ubuntu/)
2. Copy and reanme `docker.env.example` into `docker.env`
3. Fill variables for your `github-runner`:
```bash
RUNNER_VERSION=
GITHUB_TOKEN=
GITHUB_PROJECT=
RUNNER_NAME=
RUNNER_WORKDIR=
RUNNER_GROUP=
LABELS=
SSL_NO_VERIFY=
IMAGE_NAME=
CONTAINER_NAME=
DOCKER_NETWORK=
```
4. Run `build_and_run.sh` to build image and run container or use commands in Makefile (what is [Makefile](https://opensource.com/article/18/8/what-how-makefile)) for it

**Enjoy!**
