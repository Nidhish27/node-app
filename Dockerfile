FROM node:14

COPY server.js /app/server.js
WORKDIR /app

RUN npm install express

CMD ["node", "server.js"]
