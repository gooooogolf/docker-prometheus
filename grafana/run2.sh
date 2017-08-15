# echo 'Starting Grafana with custom...'
# /run.sh "$@" &
# AddDataSource() {
#   curl 'http://admin:admin@localhost:3000/api/datasources' \
#     -X POST \
#     -H 'Content-Type: application/json;charset=UTF-8' \
#     --data-binary \
#     '{"name":"Prometheus","type":"prometheus","url":"http://192.168.65.1:9090","access":"direct","isDefault":true}'
# }
# until AddDataSource; do
#   echo 'Configuring Grafana with custom...'
#   sleep 1
# done
# echo 'Done!'
# wait
