#!/bin/bash

###
# Заполняем базу данными
###

docker exec -it mongos_router mongosh --port 27020 <<EOF
use somedb

for(var i = 0; i < 2000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
EOF
