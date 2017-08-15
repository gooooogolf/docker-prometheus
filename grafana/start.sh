#!/bin/bash

: "${GRAFANA_PASS:=admin}"

echo 'Starting Grafana...'
/run.sh "$@" &
ConfigureGrafana() {
  curl "http://admin:${GRAFANA_PASS}@localhost:3000/api/datasources" \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"Prometheus","type":"prometheus","url":"http://localhost:9000","access":"direct","isDefault":true}'
}
until ConfigureGrafana; do
  echo 'Configuring Grafana...'
  sleep 1
done
echo 'Done!'
wait