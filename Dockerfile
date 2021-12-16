FROM node:lts-alpine

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .

EXPOSE 8050

RUN chown -R node /usr/src/app
USER node

CMD ["node", "index.js"]
