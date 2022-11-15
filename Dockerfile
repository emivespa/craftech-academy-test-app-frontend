FROM node:19.1.0-alpine3.16
WORKDIR /
RUN mkdir app
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . . 
RUN npm run build
RUN npm i -g serve
EXPOSE 3000
CMD [ "serve", "./build/." ]
# TODO: s/serve/nginx; using serve for now to save time.
