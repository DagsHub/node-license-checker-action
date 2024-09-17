# TODO: Node alpine
FROM node:20.3-slim

# For some reason, the executable for that package stopped working - so we'll manually link it
RUN npm install -g license-checker-rseidelsohn && \
    ln -s "$(npm root -g)/license-checker-rseidelsohn/bin/license-checker-rseidelsohn.js" /usr/local/bin/license-checker-rseidelsohn

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY allowed-licenses.txt /allowed-licenses.txt
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

