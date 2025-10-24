FROM docker.io/factoriotools/factorio:2.0.69

ENV DLC_SPACE_AGE=false

RUN cd /opt && curl -L 'https://github.com/ArchipelagoMW/Archipelago/releases/download/0.6.3/Archipelago_0.6.3_linux-x86_64.tar.gz' | tar xzf -
RUN mkdir -p /root/.cache/Archipelago
RUN echo '{"factorio_options":{"executable":"/opt/factorio/bin/x64/factorio"}}' > host.yaml

COPY ap-clean.sh ap-clean.sh

RUN sed -i '$c/ap-clean.sh && exec /opt/Archipelago/ArchipelagoLauncher "Factorio Client" -- --nogui --connect "$(cat /tmp/url)" -- "${FLAGS[@]}" "$@"' docker-entrypoint.sh
