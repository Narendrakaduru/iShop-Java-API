#!/bin/bash

# shellscript to stop running existing jar and re run new jar
################ Kill Running JAR ####################
ps -ef  | grep 'StoreAPI.jar'
sudo pkill -f StoreAPI.jar

################ BACKUP OLD JAR ####################
echo "Backup old jar"
sudo mv /jenkins/release/StoreAPI.jar /jenkins/backup/StoreAPI.jar_$(date +%F-%H:%M:%S).jar


################ START NEW JAR ####################
echo "Starting new application"
mv /jenkins/staging/StoreAPI.jar /jenkins/release
cd /jenkins/release
sudo java -jar StoreAPI.jar &

echo "Sleep 5 sec"
sleep 5s

ps -ef  | grep 'StoreAPI.jar'
echo "Deployed StoreAPI JAR successfully"
