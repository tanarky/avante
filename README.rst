avante
-------------------------

::

   brew install redis
   brew upgrade redis
   redis-server redis.conf
   bundle exec bin/importer --data data/placements.json
   bundle exec bin/dumper
   kill -TERM `cat /tmp/redis.pid`
