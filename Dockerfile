FROM alpine:latest

RUN apk update
RUN apk upgrade
RUN apk add nodejs npm
RUN npm install -g corepack
RUN npm install -g pm2
COPY dist /usr/app/
COPY yarn.lock /usr/app/yarn.lock
COPY package.json /usr/app/package.json

WORKDIR /usr/app
CMD ["sh", "-c", "yarn && pm2-runtime start src/server.js"]

EXPOSE 3000
