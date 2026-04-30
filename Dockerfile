# Use Liberica JDK 21 as requested
FROM bellsoft/liberica-openjdk-alpine:21


WORKDIR /server

RUN apk add --no-cache curl

RUN curl -o velocity.jar https://papermc.io


RUN mkdir -p plugins && \
    curl -L -o plugins/EaglerXServer.jar https://github.com


EXPOSE 25577


COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
