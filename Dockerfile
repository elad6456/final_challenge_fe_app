FROM node:14-alpine
WORKDIR /app
COPY ["package.json", "package-lock.json*","/app"]
RUN npm install

COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]
