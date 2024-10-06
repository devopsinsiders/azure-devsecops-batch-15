# Maksad - Custom Docker Image bnana hai todo ui ki
FROM node:16.20.2 AS tondumal
WORKDIR /dhondhu
COPY . .
RUN npm install  
RUN npm run build

FROM nginx:alpine
COPY --from=tondumal /dhondhu/build/ /usr/share/nginx/html/