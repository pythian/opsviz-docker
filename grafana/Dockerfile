FROM debian:jessie
MAINTAINER devops@pythian.com

ENV GRAFANA_VERSION 2.1.3

RUN apt-get update && \
    apt-get -y install libfontconfig wget curl adduser openssl ca-certificates && \
    apt-get clean && \
    wget https://grafanarel.s3.amazonaws.com/builds/grafana_${GRAFANA_VERSION}_amd64.deb -O /tmp/grafana.deb && \
    dpkg -i /tmp/grafana.deb && \
    rm /tmp/grafana.deb

# TODO: Don't store secrets in env variables
# Override default configuration with environment variables
ENV GF_SECURITY_ADMIN_PASSWORD=grafana \
    GF_SERVER_ROOT_URL="%(protocol)s://%(domain)s:%(http_port)s/grafana" \
    # Disable login page requirements, since stack is behind Doorman
    GF_USERS_ALLOW_SIGN_UP=false \
    GF_USERS_ALLOW_ORG_CREATE=false \
    GF_AUTH_BASIC_ENABLED=false \
    GF_AUTH_ANONYMOUS_ENABLED=true \
    GF_AUTH_ANONYMOUS_ORG_ROLE=Admin \
    # ENABLE LOADING JSON DASHBOARD
    GF_DASHBOARDS_JSON_ENABLED=true

COPY bin /bin/
COPY dashboards /var/lib/grafana/dashboards/

VOLUME ["/var/lib/grafana", "/var/log/grafana", "/etc/grafana"]

EXPOSE 3000

ENTRYPOINT ["/bin/start"]
