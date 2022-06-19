# --env-file .env --no-cache
docker build -f ./Dockerfile -t \
	$( grep IMAGE_NAME= docker.env | cut -d '=' -f2) \
	. $(cat docker.env | sed 's@^@--build-arg @g' | paste -s -d " ")

docker run \
	--name $( grep CONTAINER_NAME= docker.env | cut -d '=' -f2) \
	-p 9980:80 -p 9443:443 \
	$( grep IMAGE_NAME= docker.env | cut -d '=' -f2):latest	
