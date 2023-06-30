# TODO: Node alpine
FROM node:lts-alpine3.18

RUN npm install -g license-checker-rseidelsohn

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY allowed-licenses.txt /allowed-licenses.txt
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

