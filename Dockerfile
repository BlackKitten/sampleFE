FROM node:6.10.0-alpine
WORKDIR /opt/dist/
ADD package.json /opt/dist/
RUN npm install
ADD * /opt/dist/
ADD src /opt/dist/
RUN npm run build
ENTRYPOINT ["node", "/opt/server/index.js"]