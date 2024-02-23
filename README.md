[![Drone Build Status](https://img.shields.io/drone/build/William/Docker_Satisfactory-Server?server=https%3A%2F%2Fdrone.williammiceli.systems&style=for-the-badge&label=Build%20Status)](https://drone.williammiceli.systems/William/Docker_Satisfactory-Server)
[![Docker Image Size](https://img.shields.io/docker/image-size/williammiceli/satisfactory-server?style=for-the-badge)](https://hub.docker.com/r/williammiceli/satisfactory-server)

![Satisfactory Logo](https://img2.storyblok.com/fit-in/0x300/filters:format(webp)/f/110098/5405x1416/10decfbcac/hero-logo.png)


# Docker Image - Satisfactory Server

[Game Website](https://www.satisfactorygame.com/)


# Usage

## Available Tags

*	[`latest`](https://hub.docker.com/r/williammiceli/satisfactory-server/tags?name=latest)
*	[`app_build_id-<id>`](https://hub.docker.com/r/williammiceli/satisfactory-server/tags?name=app_build_id-)
*	[`ci_build-<number>`](https://hub.docker.com/r/williammiceli/satisfactory-server/tags?name=ci_build-)
*	[`commit_sha-<hash>`](https://hub.docker.com/r/williammiceli/satisfactory-server/tags?name=commit_sha-)

## Running This Image

### One-line (Useful for Testing)

```sh
docker run -d -p 7777:7777/udp -p 15000:15000/udp -p 15777:15777/udp -v /path/to/your/data:/persistent williammiceli/satisfactory-server:latest
```

### Docker Compose

#### Create compose file

Create 'docker-compose.yaml' using the following as example/template:

```yaml
version: '3.8'

services:
  satisfactory-server:
    image: docker.io/williammiceli/satisfactory-server:latest
    ports:
      - "7777:7777/udp"
      - "15000:15000/udp"
      - "15777:15777/udp"
    volumes:
      - type: bind
        source: ./data  # Path to your local directory for server data
        target: /persistent
    restart: unless-stopped
```

#### Starting Container

While in same directory of your 'docker-compose.yaml':

```sh
docker compose up -d
```

#### Stopping Container

While in same directory of your 'docker-compose.yaml':

```sh
docker compose down
```

## Updating The App

### Pull Newest Image

```sh
docker image pull williammiceli/satisfactory-server:latest
```
### Use SteamCMD In Running Container

```sh
steamcmd +force_install_dir /home/steam/satisfactory_server +login anonymous +app_update 1690800 -beta public validate +quit
```

![Player Thumbs Up](https://img2.storyblok.com/fit-in/0x800/filters:format(png)/f/110098/600x730/99e92fe34f/hero-graphic.png)


# Meta

* [Docker Hub](https://hub.docker.com/r/williammiceli/satisfactory-server)
* [Build System](https://drone.williammiceli.systems/William/Docker_Satisfactory-Server)

## Credits for Useful References

* https://openai.com/chatgpt
* https://github.com/steamcmd/docker
* https://developer.valvesoftware.com/wiki/SteamCMD#Ubuntu
* https://laszlo.cloud/drone-environment-variables-three-tips