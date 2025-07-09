#!/bin/bash
echo "Waiting for MySQL Master to be ready..."
until mysql -h mysql-master -uroot -proot -e "SELECT 1;" &> /dev/null
do
  sleep 2
done

echo "Configuring replication..."
mysql -uroot -proot <<EOF
STOP REPLICA;
CHANGE REPLICATION SOURCE TO
  SOURCE_HOST='mysql-master',
  SOURCE_PORT=3306,
  SOURCE_USER='repl',
  SOURCE_PASSWORD='replpass',
  SOURCE_AUTO_POSITION=1;

START REPLICA;
EOF
