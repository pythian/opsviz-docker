FROM elasticsearch:2.3.3

MAINTAINER lovelltroy@pythian.com

# Install the aws-cloud plugin for backups to s3
RUN /usr/share/elasticsearch/bin/plugin install cloud-aws

# Override elasticsearch.yml config
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml
