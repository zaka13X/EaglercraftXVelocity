#!/bin/sh

# Create default config if it doesn't exist
if [ ! -f velocity.toml ]; then
    java -jar velocity.jar

    pkill -f velocity.jar
fi


sed -i 's/player-info-forwarding-mode = ".*"/player-info-forwarding-mode = "legacy"/' velocity.toml


if [ -n "$BACKEND_NAME" ] && [ -n "$BACKEND_ADDRESS" ]; then
    echo "[servers]" > servers.toml
    echo "$BACKEND_NAME = \"$BACKEND_ADDRESS\"" >> servers.toml
   
fi

exec java -Xms350M -Xmx350M -jar velocity.jar

    
