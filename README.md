# Factorio Archipelago Container

A Docker container configuration for running a multiplayer Factorio server connected to an Archipelago slot.

## Setup

1. Pull the container image
2. Set `AP_URL`
3. Mount a volume for save data and the AP mod
4. Obtain the mod and put it in the save directory

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
      - AP_URL=wss://SLOTNAME:SERVERPASSWORD@archipelago.gg:PORT
```

```bash
sudo docker compose up
```
