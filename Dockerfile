FROM node:6.10.0-alpine
WORKDIR /tmp/build/
ADD package.json /tmp/build/
RUN npm install
ADD * /tmp/build/
ADD src /tmp/build/src
RUN npm run build
RUN mkdir -p /opt/dist
RUN cp -r dist /opt/dist
RUN cp index.js /opt/index.js
RUN rm -rf /tmp/build
ENTRYPOINT ["node", "/opt/index.js"]