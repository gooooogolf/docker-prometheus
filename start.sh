#!/bin/bash
docker-compose up 
echo 'Wait grafana for add datasoure 1 sec...'
wait
# docker exec -it grafana sh /run2.sh
echo 'Starting Grafana with custom...'
AddDataSource() {
  curl 'http://admin:admin@localhost:3000/api/datasources' \
    -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    --data-binary \
    '{"name":"Prometheus","type":"prometheus","url":"http://localhost:9090","access":"direct","isDefault":true}'
}
until AddDataSource; do
  echo 'Configuring Grafana with custom...'
  sleep 1
done
echo 'Done!'
