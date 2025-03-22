OCI = podman

push: build
	${OCI} push ghcr.io/hwcicd/myrtha:latest

build:
	${OCI} build . -t ghcr.io/hwcicd/myrtha:latest

