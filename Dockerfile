FROM node:12.10-slim

LABEL MAINTAINER="Tiku Okoye <okoyetiku@gmail.com>"
LABEL application="Hackathon Starter"

ENV TERM=xterm-256color

WORKDIR /usr/app

# update and install necessary packages
RUN apt-get -y update && apt-get -y upgrade

COPY package.json ./
RUN npm install

COPY . .

EXPOSE 3000
# RUN rm /usr/app/.env
RUN npm run build
CMD [ "npm", "start" ]
