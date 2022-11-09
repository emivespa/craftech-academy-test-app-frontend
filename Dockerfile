FROM node:alpine AS builder
WORKDIR /
RUN mkdir app
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . . 
RUN npm run build

FROM nginx:alpine AS server
COPY --from=builder /app/build/ /usr/share/nginx/html
