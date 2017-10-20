FROM node:alpine

# Install bower/yarn + grunt
RUN npm install -g yarn bower grunt-cli

# Install git (needed for bower)
RUN apk add --no-cache git

# Tools to change the uid on run
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk add --no-cache shadow
COPY entrypoint-chuid /usr/local/bin
ENTRYPOINT ["entrypoint-chuid"]

