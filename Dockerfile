# -*- mode: Dockerfile; tab-width: 4;indent-tabs-mode: nil;-*-
# vim: ts=4 sw=4 ft=Dockerfile et: 1

FROM nanobox/runit

# Create directories
RUN mkdir -p \
  /var/log/gonano \
  /var/nanobox \
  /opt/nanobox/hooks

# Install deps
RUN apt-get update -qq && \
    apt-get install -y rsync iputils-arping ntpdate cron && \
    apt-get clean all && \
    rm -rf \
      /var/lib/apt/lists/* \
      /var/cache/apt/* \
      /tmp/* \
      /var/tmp/*

# Install influxdb
RUN \
  echo "cd2e150c69dfdf715501deef1bfb42e6c637e9cccdac14a7d762d23a921b4fc8  -" > /tmp/checksum.txt && \
  curl -fLs https://dl.influxdata.com/influxdb/releases/influxdb_1.6.3_amd64.deb | \
  tee /tmp/influxdb.deb | sha256sum --strict -c /tmp/checksum.txt && \
  dpkg -i /tmp/influxdb.deb && \
  rm /tmp/influxdb.deb /tmp/checksum.txt

RUN /opt/gonano/bin/gem install remote_syslog_logger

ADD hooks /opt/nanobox/hooks

RUN \
  chmod +x /opt/nanobox/hooks/start && \
  chmod +x /opt/nanobox/hooks/stop && \
  chmod +x /opt/nanobox/hooks/plan && \
  chmod +x /opt/nanobox/hooks/import-clean && \
  chmod +x /opt/nanobox/hooks/import-prep && \
  chmod +x /opt/nanobox/hooks/export-live && \
  chmod +x /opt/nanobox/hooks/export-final && \
  chmod +x /opt/nanobox/hooks/configure

# Run runit automatically
CMD [ "/opt/gonano/bin/nanoinit" ]