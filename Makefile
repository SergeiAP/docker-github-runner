build_github_runner:
	docker build \
		-f ./Dockerfile \ 
		-t $( grep IMAGE_NAME= docker.env | cut -d '=' -f2) \
		. $(cat docker.env | sed 's@^@--build-arg @g' | paste -s -d " ")
run_github_runner:
	docker run \
		--name $( grep IMAGE_NAME= docker.env | cut -d '=' -f2) \
		--network=$( grep DOCKER_NETWORK= docker.env | cut -d '=' -f2) \
		-p 9980:80 -p 9443:443 \
		$( grep CONTAINER_NAME= docker.env | cut -d '=' -f2):latest	
build_run_github_runner:
	make build_github_runner
	make run_github_runner