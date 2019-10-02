FROM node:12.10-slim

LABEL MAINTAINER="Tiku Okoye <okoyetiku@gmail.com>"
LABEL application="Hackathon Starter"

WORKDIR /usr/app

# update and install necessary packages
RUN apt-get -y update && apt-get -y upgrade

# copy dependencies
COPY package.json /usr/app/package.json

# install dependencies
RUN npm install
