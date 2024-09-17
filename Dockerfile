# TODO: Node alpine
FROM node:20.3-slim

RUN npm install -g license-checker-rseidelsohn

# Create symlink if it doesn't exist
RUN if [ ! -e /usr/local/bin/license-checker-rseidelsohn ]; then \
        ln -s "$(npm root -g)/license-checker-rseidelsohn/bin/license-checker-rseidelsohn.js" /usr/local/bin/license-checker-rseidelsohn; \
    fi

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY allowed-licenses.txt /allowed-licenses.txt
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

