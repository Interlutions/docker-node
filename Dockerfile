FROM node

# Install yarn + gulp
RUN npm install -g yarn gulp

# Install git (needed for bower)
RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
	apt-get clean && \
	rm -r /var/lib/apt/lists/*

# Tools to change the uid on run
RUN apt-get update && \
    apt-get install -y --no-install-recommends sudo && \
	apt-get clean && \
	rm -r /var/lib/apt/lists/*

COPY entrypoint-chuid /usr/local/bin
ENTRYPOINT ["entrypoint-chuid"]

