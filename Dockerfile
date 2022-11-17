FROM node:19.1.0-alpine3.16 AS builder
WORKDIR /
RUN mkdir app
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . . 
RUN npm run build

FROM nginx:1.23.2-alpine AS server
COPY --from=builder /app/build/ /usr/share/nginx/html
