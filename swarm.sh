#!/bin/bash

java -jar swarm-client-3.4.jar \
  -master $HOST \
  -fsroot /tmp/jenkins \
  -executors 1 \
  -labels swarm \
  -name swarm \
  -username $USER \
  -password $PASSWORD \
  -disableSslVerification
