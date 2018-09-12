#/bin/bash!

EPC_NAMESPACE=epc3
SERVICE_NAME=kube-dns
SCRIPT_PATH=./
#Get service details
SERVICE_OUTPUT=$(sudo kubectl get service -n $EPC_NAMESPACE | grep -i $SERVICE_NAME | awk '{print $1}' )
if [[ "$SERVICE_OUTPUT" ]]; then
 echo service $SERVICE_OUTPUT Present
else 
 echo Sevice is not present needs to create service and resources
 #For switching from first pod to second pod:
 $SCRIPT_PATH/create-tosca.sh
 kubectl apply -f $SCRIPT_PATH/demodownload-route-v2.yaml
 kubectl apply -f $SCRIPT_PATH/download-deployment-v2.yaml
 kubectl delete -f $SCRIPT_PATH/download-deployment-v1.yaml
fi
