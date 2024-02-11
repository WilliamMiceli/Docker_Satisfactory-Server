[![Build Status](https://drone.williammiceli.systems/api/badges/William/Docker_Satisfactory-Server/status.svg)](https://drone.williammiceli.systems/William/Docker_Satisfactory-Server)

# Docker Image - Satisfactory Server

[Game Website](https://www.satisfactorygame.com/)


# Usage

## Public Image Repository

[Docker Hub](https://hub.docker.com/r/williammiceli/satisfactory-server)


## Running This Image

### One-line (Useful for Testing)

```sh
docker run -d -p 7777:7777/udp -p 15000:15000/udp -p 15777:15777/udp -v /path/to/your/data:/home/steam/.config/Epic/FactoryGame/Saved williammiceli/satisfactory-server:latest
```

### Docker Compose

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
        target: /home/steam/.config/Epic/FactoryGame/Saved
    restart: unless-stopped
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

# Credits for Useful References

* https://openai.com/chatgpt
* https://github.com/steamcmd/docker
* https://developer.valvesoftware.com/wiki/SteamCMD#Ubuntu
* https://laszlo.cloud/drone-environment-variables-three-tips