FROM node:16-alpine3.11

LABEL maintainer="Luis Nascimento"

RUN mkdir -p /usr/share/node/app/node_modules && chown -R node:node /usr/share/node

WORKDIR /usr/share/node/app

COPY nodeapp/package*.json ./

RUN npm install

COPY --chown=node:node nodeapp/ .

USER node

EXPOSE 3000

CMD [ "node", "index.js" ]