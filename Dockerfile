# stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm config rm proxy
RUN npm config rm proxy --global
RUN npm config rm https-proxy
RUN npm config rm https-proxy --global
RUN npm config rm registry

RUN npm config set https-proxy http://${uname}:${pword}@${prox}:${port}--global
RUN npm config set https-proxy http://${uname}:${pword}@${prox}:${port}
RUN npm config set proxy http://${uname}:${pword}@${prox}:${port}--global
RUN npm config set proxy http://${uname}:${pword}@${prox}:${port}
RUN npm config set registry http://registry.npmjs.org
RUN npm config set strict-ssl false

RUN npm install
RUN npm start

# stage 2
#FROM nginx:alpine
#COPY --from=node /app/dist/angular-app /usr/share/nginx/html
