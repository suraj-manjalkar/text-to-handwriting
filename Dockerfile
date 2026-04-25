# BASE IMAGE
FROM node:latest AS builder

WORKDIR /app

COPY --exclude=package-lock.json . .

RUN npm install package.json


##################
## Second Build ##
##################

FROM node:25.9-slim

WORKDIR /app

COPY --exclude=package-lock.json . .

COPY --from=builder /app/node_modules/ /app/node_modules/

EXPOSE 5000

CMD ["npm","run","dev"]
