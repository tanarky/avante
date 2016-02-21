avante
==================

$NAME = avante

todo
-------------------------

- config environment
- lua logging
- user data sample
- creative data sample
- lock ?
- ターゲティングもload_scriptしておく？

log
-------------------------

- 結局、全部redisでやる

  - aerospikeにはUDF内で他のkeyを参照できないから
  - scanでpriority=highにして同期処理にしてもいいが、怖いので却下

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

