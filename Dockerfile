FROM node:6.10.3-slim
RUN mkdir /app/ -p
WORKDIR /app
COPY . /app/
RUN  npm install     
RUN npm run build         
CMD npm run dev
