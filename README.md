## Redis Dockerfile

This repository contains **Dockerfile** of [Redis](http://redis.io/) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/imanel/redis/) published to the public [Docker Registry](https://index.docker.io/).

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/imanel/redis/) from public [Docker Registry](https://index.docker.io/): `docker pull imanel/redis`

### Usage

#### Run `redis-server`

    docker run -d --name redis -p 6379:6379 imanel/redis

#### Run `redis-cli`

    docker run -i --rm -t --entrypoint="bash" --link redis:redis imanel/redis -c 'redis-cli -h $REDIS_PORT_6379_TCP_ADDR'
