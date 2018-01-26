FROM node:6.10.0-alpine as npminstaller
WORKDIR /opt/dist/
ADD package.json /opt/dist/
RUN npm install

FROM node:6.10.0-alpine as appbuilder
WORKDIR /opt/dist/
COPY --from=npminstaller /opt/dist /opt/dist
ADD * /opt/dist/
ADD src /opt/dist/src
RUN npm run build

FROM node:6.10.0-alpine
WORKDIR /opt/dist/
COPY --from=appbuilder /opt/dist/dist /opt/dist
COPY --from=appbuilder /opt/dist/index.js /opt/dist/index.js
ENTRYPOINT ["node", "/opt/dist/index.js"]