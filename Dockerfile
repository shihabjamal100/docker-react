FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build usr/share/nginx/html
# note we don't need to specify starting the nginx container
# as the nginx image will by default start the nginx container.