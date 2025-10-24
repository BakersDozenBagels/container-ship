# Factorio Archipelago Container

A Docker container configuration for running a multiplayer Factorio server connected to an Archipelago slot.

## Setup

1. Pull the container image
2. Set `AP_ROOM`, `AP_PLAYER`, and `AP_PASSWORD`
3. Mount a volume for save data and the AP mod

Using `compose.yaml`:
```yaml
services:
  factorio:
    image: docker.io/bakersdozenbagels/container-ship:latest
    ports:
      - "34197:34197/udp"
      - "27015:27015/tcp"
    volumes:
      - C:\\ap-factorio:/factorio
    environment:
      - AP_ROOM=abcdefghijklmnopqrstuv
      - AP_PLAYER=Player1
      - AP_PASSWORD=
    restart: unless-stopped
```

```bash
sudo docker compose up -d
```

## Configuration

Container Ship transitively supports everything [factorio-docker](github.com/factoriotools/factorio-docker/) does.

Archipelago-specific environment variables with default values:
```env
# Connection Configuration:
AP_ROOM=     # The room ID to fetch the mod and port from. Requires AP_PLAYER to work.
AP_PLAYER=   # The slot name to connect as.
AP_PASSWORD= # The password to connect with.

# Advanced Connection Configuration:
# Change these if you're connecting to a webhost other than archipelago.gg.
AP_ROOM_BASE=https://archipelago.gg # The root URL of the webhost. This is used to fetch the mod and latest port for the room.
AP_PROTOCOL=wss                     # Change this to "ws" if your server doesn't have a TLS certificate.
AP_URL_BASE=archipelago.gg          # The URL you would connect to with the Archipelago Client.

# Connection Override:
AP_URL= # The full connection string, e.g. "wss://Player1:Password@archipelago.gg:12345".
        # Ignored if AP_ROOM is in use.
        # When active, the mod is not automatically managed, and must be put into the volume manually.
```
