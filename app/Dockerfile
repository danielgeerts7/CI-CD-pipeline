# Pull image from Docker Hub
FROM node:17-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy app dependency list
COPY package.json ./
COPY package-lock.json ./

# Install dependencies
RUN npm ci

# Copy app source
COPY app.js .

EXPOSE 3000
CMD ["node", "app.js"]