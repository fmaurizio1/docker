#!/bin/bash

# java -jar swarm-client-3.4.jar -master http://jenkins.esteco.lan -fsroot /tmp/jenkins -executors 1 -labels somo -name rhapsody -username fmaurizio -password $1 -disableSslVerification
java -jar swarm-client-3.4.jar -master http://localhost:8090 -fsroot /tmp/jenkins -executors 1 -labels swarm -name rhapsody -username admin -password $1 -disableSslVerification
