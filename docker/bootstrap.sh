#!/bin/sh

ZK_SERVER=${ZK_SERVER:-"localhost:2181"}

USER_SET=${USER_SET:-"{\"users\": [{ \"username\":\"admin\" , \"password\":\"manager\",\"role\": \"ADMIN\" \},{ \"username\":\"appconfig\" , \"password\":\"appconfig\",\"role\": \"USER\" \}]\}"}
LOGIN_MESSAGE=${LOGIN_MESSAGE:-"Please login using admin/manager or appconfig/appconfig."}

sed -i "s/^zkServer=.*$/zkServer=%s/" /var/app/config.cfg <<< "$ZK_SERVER"

sed -i "s/^userSet = .*$/userSet = %s/" /var/app/config.cfg <<< "$USER_SET"
sed -i "s/^loginMessage=.*$/loginMessage=%s/" /var/app/config.cfg <<< "$LOGIN_MESSAGE"

echo "Starting zkui with server $ZK_SERVER"

exec java -jar /var/app/zkui.jar