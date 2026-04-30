# Use a high-performance, premade Minecraft proxy image
FROM itzg/bungeecord:latest


LABEL maintainer="Eaglercraft-Docker(zaka13 made dis)"


ENV BACKEND_SERVER_NAME="lobby"
ENV BACKEND_SERVER_IP="127.0.0.1"
ENV BACKEND_SERVER_PORT="25565"

ADD https://github.com /plugins/EaglerXBungee.jar

RUN echo '#!/bin/bash\n\
sed -i "s/address: localhost:25565/address: ${BACKEND_SERVER_IP}:${BACKEND_SERVER_PORT}/g" /server/config.yml\n\
exec /start' > /entrypoint.sh && chmod +x /entrypoint.sh


EXPOSE 8081

ENTRYPOINT ["/entrypoint.sh"]

