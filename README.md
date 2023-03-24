# simple-go-fileserv

## Build image on M1

docker buildx build -t newa/fileserv:1.0 --platform linux/amd64 -f Dockerfile . --push

## path to push share files

/tmp

## set port to listen

env variable: APP_PORT
