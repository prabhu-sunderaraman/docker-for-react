FROM node:alpine as setup
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=setup /app/build /usr/share/nginx/html
