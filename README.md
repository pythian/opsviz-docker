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
