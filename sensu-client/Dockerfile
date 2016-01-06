FROM opsvizdocker_sensu-server
MAINTAINER devops@pythian.com

RUN rm /etc/sensu/conf.d/*

# Install check dependencies
RUN gem install carrot-top --no-ri --no-doc