FROM node:14-alpine as builder
WORKDIR /app
ENV CI=true
COPY ./helloworld.txt ./code/helloworld.txt
RUN npm test || true

FROM node:14-alpine as test
WORKDIR /app
ENV CI=true
COPY ./helloworld.txt ./code/helloworld.txt
RUN npm test || true
