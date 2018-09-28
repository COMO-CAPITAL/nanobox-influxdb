# nanobox-influxdb

Nanobox data service [InfluxDB](https://www.influxdata.com/) component.

### Usage

```yml
data.influx:
  image: comocapital/nanobox-influxdb:1.6.3
  config:
    http_shared_secret: 'foobar123'
    http_log_enabled: true
    # full parameter's list see in hooks/lib/influxdb.rb
```

#### Where are authentication? Are you crazy?

InfluxDB started on isolated environment. Only your app will see Influx's host/port.

### License

Copyright &copy; 2018 Como Capital