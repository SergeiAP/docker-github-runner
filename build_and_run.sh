# --env-file .env --no-cache
docker build -f ./Dockerfile -t \
	$( grep IMAGE_NAME= docker.env | cut -d '=' -f2) \
	. $(cat docker.env | sed 's@^@--build-arg @g' | paste -s -d " ")

docker run --name $( grep IMAGE_NAME= docker.env | cut -d '=' -f2) \
	--network=$( grep DOCKER_NETWORK= docker.env | cut -d '=' -f2) \
	-p 9980:80 -p 9443:443 \
	$( grep CONTAINER_NAME= docker.env | cut -d '=' -f2):latest