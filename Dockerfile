FROM node:16-alpine3.16
RUN apk update && \
    apk upgrade && \
    apk add --no-cache vim bash git

RUN npm install -g @nestjs/cli

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install

COPY . .

CMD ["yarn", "start:dev"]