docker buildx build \
    --platform linux/arm64/v8 \
    --tag ubuntu:16.04 \
    --build-arg BASE_IMAGE=ubuntu:16.04 \
    --build-arg UBUNTU=16.04 \
    --file ./ubuntu/Dockerfile \
    .