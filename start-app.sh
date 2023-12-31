#!/bin/bash

# shellscript to stop running existing jar and re run new jar
################ Kill Running JAR ####################
ps -ef  | grep 'StoreAPI.jar'
sudo pkill -f StoreAPI.jar

################ BACKUP OLD JAR ####################
echo "################ BACKUP OLD JAR ####################"
sudo mv /jenkins/release/StoreAPI.jar /jenkins/backup/StoreAPI.jar_$(date +%F-%H:%M:%S).jar
ls -ltr /jenkins/backup
echo "################ BACKUP SUCCESS ####################"

################ STARTING STORE APP ####################
echo "################ STARTING STORE APP ####################"
mv /jenkins/staging/StoreAPI.jar /jenkins/release
cd /jenkins/release
sudo java -jar StoreAPI.jar &
echo "Sleep 5 sec"
sleep 5s
ls -ltr /jenkins/release
echo "################ STORE APP RUNNING ####################"


ps -ef  | grep 'StoreAPI.jar'
echo "Deployed StoreAPI JAR successfully"
