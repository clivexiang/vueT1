FROM node:8.12-alpine as builder

WORKDIR /app
COPY package.json /app/package.json
RUN npm install 

COPY . /app
RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/dist/* /usr/share/nginx/html/

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD nginx -g "daemon off;"
