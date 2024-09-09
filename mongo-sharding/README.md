# pymongo-api

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Инициализируем шарды

```shell
./scripts/mongo-init-shard.sh
```

Заполняем mongodb данными

```shell
./scripts/mongo-insert.sh
```

## Как проверить

Выводим общее количество документов, и отдельно по каждому шарду

```shell
./scripts/mongo-count.sh
```
