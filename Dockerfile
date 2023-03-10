# -- BUILD STAGE --
FROM node:alpine as builder

WORKDIR /app

COPY package*.json .

RUN npm install --silent

COPY . .

RUN npm run build

# -- FINAL STAGE --
FROM nginx:alpine

EXPOSE 80
COPY --from=builder /app/dist /usr/share/nginx/html
