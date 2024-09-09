#!/bin/bash

###
# Инициализируем бд
###

docker exec -it configSrv mongosh --port 27017 <<EOF
rs.initiate(
  {
    _id : "config_server",
       configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27017" }
    ]
  }
);
EOF

docker exec -it shard1-r1 mongosh --port 27021 <<EOF
rs.initiate(
  {
    _id : "shard1",
    members: [
      { _id : 0, host : "shard1-r1:27021" },
      { _id : 1, host : "shard1-r2:27022" },
      { _id : 2, host : "shard1-r3:27023" },
    ]
  }
);
EOF

docker exec -it shard2-r1 mongosh --port 27031 <<EOF
rs.initiate(
  {
    _id : "shard2",
    members: [
      { _id : 0, host : "shard2-r1:27031" },
      { _id : 1, host : "shard2-r2:27032" },
      { _id : 2, host : "shard2-r3:27033" },
    ]
  }
);
EOF

docker exec -it mongos_router mongosh --port 27020 <<EOF
sh.addShard( "shard1/shard1-r1:27021", "shard1/shard1-r2:27022", "shard1/shard1-r3:27023");
sh.addShard( "shard2/shard2-r1:27031", "shard2/shard2-r2:27032", "shard2/shard2-r3:27033");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
EOF
