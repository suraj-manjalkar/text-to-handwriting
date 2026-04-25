# BASE IMAGE
FROM node:latest

WORKDIR /app 

COPY --exclude=package-lock.json . .

RUN npm install package.json

EXPOSE 5000

CMD ["npm","run","dev"]

