
---
name: Docker Notes
---

# Docker Notes

### Container Commands
List all exited containers:
`docker ps -a --filter status=exited`

Remove all exited containers:
`docker rm $(docker ps -a --filter=exited)`

## Image Commands
### List images
`docker image ls`

### Build a container from Dockerfile
Command assumes the Dockerfile is in the root of the cmd. 
Switch `-t` tags the container with a name.
`docker build -t <container_tag> .`

### Commit container image
Save/commit a running container so it can be reused.
`docker commit <CONTAINER ID> <ORG NAME>/<IMAGE NAME>:<VERSION>`
