FROM pataquets/nodejs
MAINTAINER devops@pythian.com

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install git \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  git clone --single-branch --branch master https://github.com/movableink/doorman.git && \
  cd /doorman && \
  npm install && \
  mv conf.environment.js conf.js

WORKDIR /doorman

COPY doorman.conf.js /doorman/conf.js

ENTRYPOINT [ "npm", "start" ]
