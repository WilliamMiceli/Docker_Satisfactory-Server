FROM docker.io/library/ubuntu:24.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Agree to Steam terms prompt (used during steamcmd install)
RUN echo steam steam/question select "I AGREE" | debconf-set-selections && \
    echo steam steam/license note '' | debconf-set-selections

# Install SteamCMD
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends ca-certificates locales steamcmd && \
    ln -s /usr/games/steamcmd /usr/bin/steamcmd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add unicode support
RUN locale-gen en_US.UTF-8
ENV LANG 'en_US.UTF-8'
ENV LANGUAGE 'en_US:en'

# Create user for SteamCMD
RUN useradd -m steam

# Switch to Steam user
USER steam
WORKDIR /home/steam

# Install Satisfactory dedicated server
RUN steamcmd +force_install_dir /home/steam/satisfactory_server +login anonymous +app_update 1690800 -beta public validate +quit

# Expose ports:
# - 7777/udp for game traffic
# - 15000/udp for query traffic
# - 15777/udp for Steam traffic
EXPOSE 7777/udp 15000/udp 15777/udp

# Persistent data volume for the server
VOLUME ["/home/steam/.config/Epic/FactoryGame/Saved"]

# Start command for the server
CMD ["/home/steam/satisfactory_server/FactoryServer.sh"]