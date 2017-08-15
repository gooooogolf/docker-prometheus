#!/bin/bash
: "${GRAFANA_USER:=admin}"
: "${GRAFANA_PASS:=admin}"

echo 'Starting Grafana...'
/run.sh "$@" &
HealthCheck() {
    curl --silent "http://${GRAFANA_USER}:${GRAFANA_PASS}@localhost:3000/api/health" \
    -X GET \
    -H 'Content-Type: application/json;charset=UTF-8'
}

AddDatasource() {
  curl "http://${GRAFANA_USER}:${GRAFANA_PASS}@localhost:3000/api/datasources" \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"Prometheus","type":"prometheus","url":"http://localhost:9000","access":"direct","isDefault":true}'
}
sleep 30
until HealthCheck; do
  echo 'healthCheck'
  sleep 5
done
AddDatasource;
echo 'Done!'
wait