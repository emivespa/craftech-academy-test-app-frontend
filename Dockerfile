FROM node:alpine
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
