#Executing builder phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY 'package.json' '.'
RUN npm install
COPY . .
RUN npm run build
#Executing run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
