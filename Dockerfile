FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# nginx is going to run automatically what we've copied on /usr/share/nginx/html

