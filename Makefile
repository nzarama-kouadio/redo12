# Define variables
IMAGE_NAME = hangman-app
DOCKER_ID_USER = nmk43
CONTAINER_NAME = hangman-container
PORT = 5000

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME):latest .

# Run the Docker container
run:
	docker run -p $(PORT):$(PORT) $(IMAGE_NAME)

# Stop and remove all containers associated with the image, then delete the image
clean:
	-docker ps -a -q --filter ancestor=$(IMAGE_NAME) | xargs -r docker stop
	-docker ps -a -q --filter ancestor=$(IMAGE_NAME) | xargs -r docker rm
	-docker images -q $(IMAGE_NAME) | xargs -r docker rmi -f

# Show all Docker images
image_show:
	docker images

# Show all running Docker containers
container_show:
	docker ps

# Push the Docker image to Docker Hub
push:
	docker tag $(IMAGE_NAME):latest $(DOCKER_ID_USER)/$(IMAGE_NAME):latest
	docker push $(DOCKER_ID_USER)/$(IMAGE_NAME):latest

# Login to Docker Hub
login:
	docker login -u $(DOCKER_ID_USER)

# Tag and re-push image to Docker Hub
rebuild:
	clean build push
