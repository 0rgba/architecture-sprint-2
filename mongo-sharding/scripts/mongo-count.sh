#!/bin/bash

###
# Выводим количество документов
###

docker exec -it mongos_router mongosh --port 27020 <<EOF
use somedb

db.helloDoc.countDocuments()
EOF

docker exec -it shard1 mongosh --port 27018 <<EOF
use somedb

db.helloDoc.countDocuments();
EOF

docker exec -it shard2 mongosh --port 27019 <<EOF
use somedb

db.helloDoc.countDocuments();
EOF
