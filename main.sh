#!/bin/bash
# Define variables
DOCKERFILE_DIR="."  # Directory containing the Dockerfile
IMAGE_NAME="bounty_pre"
CONTAINER_NAME="con"
NEW_IMAGE_NAME="bug_bounty_ready"


# Step 1: Build the Docker image
echo "Building Docker image..."
docker build  --progress=plain  -t $IMAGE_NAME $DOCKERFILE_DIR 
#docker buildx build --progress plain  -t $IMAGE_NAME $DOCKERFILE_DIR 
# Step 2: Run the Docker container
echo "Running container..."
docker run -d --name $CONTAINER_NAME $IMAGE_NAME
# Step 4: Commit the container to a new image
echo "Committing changes to a new image..."
docker commit $CONTAINER_NAME $NEW_IMAGE_NAME
docker rmi -f $IMAGE_NAME
docker ps -a --filter "ancestor=bounty_pre" -q | xargs -I {} docker rm -f {} || echo "No containers to remove"
docker rm -f con
docker rmi $(docker images -f "dangling=true" -q)

echo "You Can use bug_bounty_ready docker images."
echo "Process complete!"
