FROM node:10.15.3-alpine 
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]