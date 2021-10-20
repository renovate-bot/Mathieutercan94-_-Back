FROM node:lts-alpine

WORKDIR /app/back

ARG ARG_STAGE

ARG ARG_COMMAND

ENV STAGE $ARG_STAGE

ENV COMMAND $ARG_COMMAND

ENV PATH /app/back/node_modules/.bin:$PATH

COPY package.json /app/back

RUN npm install nodemon -g --silent

RUN npm install --silent

EXPOSE 8080

COPY . /app/back

CMD [ "sh", "-c", "NODE_ENV=$STAGE $COMMAND src/start.js" ]
