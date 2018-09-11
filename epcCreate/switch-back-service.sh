#!/bin/bash

EPC_NAMESPACE=epc3
SERVICE_NAME=kube-dns
SCRIPT_PATH=./
#Get service details
SERVICE_OUTPUT=$(sudo kubectl get service -n $EPC_NAMESPACE | grep -i $SERVICE_NAME | awk '{print $1}' )
if [[ "$SERVICE_OUTPUT" ]]; then
 echo service $SERVICE_OUTPUT Present
 #For switching back from second pod to first pod:
 $SCRIPT_PATH/delete-tosca.sh
 kubectl apply -f $SCRIPT_PATH/demodownload-route-v1.yaml
 kubectl apply -f $SCRIPT_PATH/download-deployment-v1.yaml
 kubectl delete -f $SCRIPT_PATH/download-deployment-v2.yaml
else 
 echo Sevice is not present needs to create service and resources
fi
