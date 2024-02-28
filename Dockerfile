FROM node:16-alpine as builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

#nginx is a web server which serves web traffic routing to application.
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html