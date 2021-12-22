# Pull image from Docker Hub
FROM node:17-alpine

# Create app directory
WORKDIR /usr/src/app

# Copy app dependency list
COPY package.json ./

# Install dependencies
RUN npm install

# Copy app source
COPY app.js .

EXPOSE 3000
CMD ["node", "app.js"]
