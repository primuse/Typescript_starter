FROM node:12.10-slim

LABEL MAINTAINER="Tiku Okoye <okoyetiku@gmail.com>"
LABEL application="Hackathon Starter"


WORKDIR /usr/app

# update and install necessary packages
RUN apt-get -y update && apt-get -y upgrade

COPY package.json ./
RUN npm install

# copy source files to docker environment
COPY . .

# expose port 3000
EXPOSE 3000

RUN npm run build

# command to start the container
CMD [ "npm", "start" ]
