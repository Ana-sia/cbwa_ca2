FROM node:19-alpine as build

RUN npm install -g ionic
RUN npm install

RUN npm run-script build --prod

FROM nginx:alpine


EXPOSE 8080