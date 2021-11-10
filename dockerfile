FROM node:14.17.0

RUN whoami
RUN usermod -G root node
RUN echo $pwd

LABEL Author="Selvanathan V selvanathan.v@bahwancybertek.com"
LABEL Version="1.0"

RUN apt-get update && apt-get install -y \
    sudo \
    curl \
    wget \
    apt-transport-https \
    apt-utils \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list \
    && sudo apt-get install -y --no-install-recommends yarn \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/node/svc
WORKDIR /home/node/svc

ENV NODE_ENV development

COPY ./package.json ./
COPY ./yarn.lock ./

RUN yarn install

COPY . .

EXPOSE 80

CMD ["node", "."]  