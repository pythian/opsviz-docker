FROM rabbitmq:management
MAINTAINER devops@pythian.com

WORKDIR /etc/rabbitmq

COPY ["conf/rabbitmq.config", "conf/rabbit_definitions.json", "./"]

# TODO: loading definitions has insecure default passwords
RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbit_definitions.json
