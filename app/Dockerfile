FROM node:17-alpine

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm ci

COPY . .

USER node

EXPOSE 3000

CMD ["node", "app.js"]