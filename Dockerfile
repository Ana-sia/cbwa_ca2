FROM node:19-alpine as build

RUN npm install -g ionic
RUN npm install

WORKDIR /app
RUN wget https://github.com/Ana-sia/mobdev_ca3/archive/main.tar.gz && tar xf main.tar.gz && rm main.tar.gz

WORKDIR /app/mobdev_ca3-main/

RUN npm run-script build --prod

FROM nginx:alpine


EXPOSE 8080