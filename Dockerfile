FROM node:14-alpine AS build
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
WORKDIR '/app'
COPY --from=build /app/build /usr/share/nginx/html
