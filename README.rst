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
:$NAME-ad-models: redisとそれを操作する配信用ad models
:$NAME-ad-api: sinatora + unicorn, needs ad-models
:$NAME-ad-q-client: , needs ad-models
:$NAME-ad-q-server: , needs ad-models


案件のコントロールと配信最適化コントロールは別コンポーネントか？
