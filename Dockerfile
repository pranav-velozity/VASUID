# Dockerfile for UID Ops Backend
FROM node:20-alpine

# better-sqlite3 needs build toolchain
RUN apk add --no-cache python3 make g++

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

COPY . .
ENV PORT=4000
EXPOSE 4000
CMD ["node", "server.js"]
