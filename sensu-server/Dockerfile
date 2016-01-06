FROM debian:jessie
MAINTAINER devops@pythian.com

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y --no-install-recommends install unzip wget ca-certificates \
  && \
  wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add - && \
  echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN \
  apt-get update && \
  apt-get install -y sensu && \
  #Nokogiri is needed by aws plugins
  apt-get install -y libxml2 libxml2-dev libxslt1-dev zlib1g-dev build-essential ruby-dev ruby  && \
  gem install nokogiri && \
  apt-get remove -y libxml2-dev libxslt1-dev zlib1g-dev && \
  apt-get autoremove -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

ENV DOCKERIZE_VERSION=0.0.4

RUN \
  wget https://github.com/jwilder/dockerize/releases/download/v"$DOCKERIZE_VERSION"/dockerize-linux-amd64-v"$DOCKERIZE_VERSION".tar.gz && \
  tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v"$DOCKERIZE_VERSION".tar.gz

ENV PATH=/opt/sensu/embedded/bin:$PATH \
    DEFAULT_PLUGINS_REPO=sensu-plugins \
    #Client Config
    CLIENT_SUBSCRIPTIONS=all,default \
    #Common Config
    RUNTIME_INSTALL='' \
    LOG_LEVEL=warn \
    EMBEDDED_RUBY=true \
    CONFIG_FILE=/etc/sensu/config.json \
    CONFIG_DIR=/etc/sensu/conf.d \
    EXTENSION_DIR=/etc/sensu/extensions \
    PLUGINS_DIR=/etc/sensu/plugins \
    HANDLERS_DIR=/etc/sensu/handlers

COPY templates /etc/sensu/templates
COPY bin /bin/

RUN \
  #Plugins needed for handlers
  /bin/install hipchat mailer pagerduty graphite
  #Plugins needed for checks and maybe handlers
  #/bin/install docker aws http graphite ftp consul etcd redis elasticsearch
  # /bin/install docker http ftp consul etcd redis elasticsearch

RUN \
  wget https://github.com/pythian/opsviz-sensu/archive/master.zip && \
  unzip master.zip && \
  rm master.zip && \
  rm opsviz-sensu-master/README.md && \
  mv opsviz-sensu-master/* /etc/sensu/. && \
  rm -rf opsviz-sensu-master

COPY conf.d /etc/sensu/conf.d/

EXPOSE 4567
VOLUME ["/etc/sensu/conf.d"]

ENTRYPOINT ["/bin/start"]
