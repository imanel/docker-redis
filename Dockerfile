FROM imanel/base
MAINTAINER Bernard Potocki <bernard.potocki@imanel.org>

# Add PPA and install Redis
RUN apt-add-repository -y ppa:chris-lea/redis-server && \
    apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
      redis-server=2:2.8.*

# Configure Redis
RUN sed -i "s/^daemonize yes/daemonize no/" /etc/redis/redis.conf && \
    sed -i "s/^bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf && \
    sed -i "s/^logfile /# logfile /" /etc/redis/redis.conf && \
    sysctl vm.overcommit_memory=1 > /dev/null

# Expose ports.
EXPOSE 6379

# Define an entry point.
ENTRYPOINT ["redis-server"]
