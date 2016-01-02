avante
==================

$NAME = avante

setup
-------------------------

::

   brew install redis
   brew upgrade redis
   redis-server redis.conf
   bundle exec bin/importer --data data/placements.json
   bundle exec bin/dumper
   kill -TERM `cat /tmp/redis.pid`

components
-------------------------

:$NAME-user-store: aerospike ?
:$NAME-models: redisとそれを操作する配信用models
:$NAME-api: sinatora + unicorn, needs models
:$NAME-q-client: , needs models
:$NAME-q-server: , needs models


案件のコントロールと配信最適化コントロールは別コンポーネントか？
