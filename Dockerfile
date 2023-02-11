FROM node:19-alpine

ARG _WORKDIR=/home/node/app
ARG PORT=3333

USER root
RUN apk add git
RUN apk add --no-cache gcompat libstdc++
RUN corepack enable
RUN corepack prepare pnpm@latest --activate

WORKDIR ${_WORKDIR}

ADD . ${_WORKDIR}
RUN pnpm install

USER node
EXPOSE ${PORT}

CMD pnpm start