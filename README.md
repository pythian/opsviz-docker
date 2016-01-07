# opsviz-docker
Dockerized OpsViz stack

## Mac OSX Local Deployment
### Dependencies
- Docker Toolbox

### Get started
- Clone this repository and cd into it
- Create Docker Machine. Example:

```bash
docker-machine create -d virtualbox \
  --virtualbox-disk-size "30000" \
  --virtualbox-cpu-count "4" \
  --virtualbox-memory "6144" \
  opsviz
```

- Set Terminal environment

```bash
eval "$(docker-machine env opsviz)"

# Verify docker environment variables
env | grep DOCKER_
```

- Run docker-compose

```bash
docker-compose up -d
```

- Update /etc/hosts on Mac to point 'dashboard' to docker-machine IP

```bash
$ grep dashboard /etc/hosts
192.168.99.100 dashboard
```

- Point browser to:
    - Grafana: [http://dashboard/grafana/](http://dashboard/grafana/)
    - RabbitMQ: [http://dashboard/rabbitmq/](http://dashboard/rabbitmq/)
    - Uchiwa: [http://dashboard/sensu/](http://dashboard/sensu/)

- Currently, you have to manually add the graphite datasource via the grafana dashboard.

## TODO
- ElasticSearch and Kibana containers have not been tested, as the initial development makes use of AWS ElasticSearch service
- Does not have sensu clients for all containers. Currently, containers are built without sensu-client running, and requires running a <service>-sensu container with appropriate subscriptions. Need to determine if each container should run sensu-client natively.
- Make containers stateless and ability to cluster appropriate services for HA. Service Discovery will be necessary

