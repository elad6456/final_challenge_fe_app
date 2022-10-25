FROM node:14-alpine as builder
WORKDIR /app
ENV PATH=/app/node_modules/.bin
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install

COPY . .

CMD [ "npm", "start" ]
