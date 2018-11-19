FROM node:10-alpine

# Install bower/yarn + grunt
RUN npm install -g yarn gulp

# Tools to change the uid on run
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk add --no-cache shadow su-exec
COPY entrypoint-chuid /usr/local/bin
ENTRYPOINT ["entrypoint-chuid"]

