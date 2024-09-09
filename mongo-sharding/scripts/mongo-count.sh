#!/bin/bash

###
# Выводим количество документов
###

docker exec -it mongos_router mongosh --port 27020 --eval "db.helloDoc.countDocuments()" somedb

docker exec -it shard1 mongosh --port 27018 --eval "db.helloDoc.countDocuments()" somedb

docker exec -it shard2 mongosh --port 27019 --eval "db.helloDoc.countDocuments()" somedb
