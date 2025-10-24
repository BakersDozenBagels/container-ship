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
