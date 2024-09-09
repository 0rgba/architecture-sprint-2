#!/bin/bash

###
# Выводим количество документов
###

docker exec -it mongos_router mongosh --port 27020 --eval "db.helloDoc.countDocuments()" somedb

docker exec -it shard1-r1 mongosh --port 27021 --eval "db.helloDoc.countDocuments()" somedb

docker exec -it shard2-r1 mongosh --port 27031 --eval "db.helloDoc.countDocuments()" somedb
