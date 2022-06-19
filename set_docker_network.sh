docker network connect \
	$( grep DOCKER_NETWORK= docker.env | cut -d '=' -f2) \
	$( grep CONTAINER_NAME= docker.env | cut -d '=' -f2)
