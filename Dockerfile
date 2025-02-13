FROM node:14.16.1-slim

ENV USER=ALvinave

# install python and make
RUN apt-get update && \
	apt-get install -y python3 build-essential && \
	apt-get purge -y --auto-remove
	
# create evobot user
RUN groupadd -r ${USER} && \
	useradd --create-home --home /home/ALvinave -r -g ${USER} ${USER}
	
# set up volume and user
USER ${USER}
WORKDIR /home/ALvinave

COPY package*.json ./
RUN npm install
VOLUME [ "/home/ALvinave" ]

COPY . .

ENTRYPOINT [ "node", "index.js" ]
