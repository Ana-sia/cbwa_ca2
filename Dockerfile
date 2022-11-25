# to use node19 alpine from dockerhub to use as a base image, build - short name for the command:
FROM node:19-alpine as build

# to install ionic and its dependencies:
RUN npm install -g ionic
RUN npm install

# to create working directory:
WORKDIR /app

# to download CA3 content:
RUN wget https://github.com/Ana-sia/mobdev_ca3/archive/main.tar.gz && tar xf main.tar.gz && rm main.tar.gz

WORKDIR /app/mobdev_ca3-main/

# to copy everything from the root directory to app directory:
RUN npm run-script build --prod

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/mobdev_ca3-main/www /usr/share/nginx/html/


EXPOSE 8080
