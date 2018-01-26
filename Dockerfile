FROM node:6.10.0-alpine
ADD * /opt/dist/
WORKDIR /opt/dist/
RUN npm install
RUN npm run build
ENTRYPOINT ["node", "/opt/server/index.js"]