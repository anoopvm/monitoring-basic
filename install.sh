echo "Labeling the node for prometheus/grafana..."
kubectl label node $1 monitoring=telemetry --overwrite
echo "Creating PV..."
kubectl create -f telemetry_pv.yaml
echo "Creating PVs..."
kubectl create -f telemetry_pvc.yaml
echo "Creating PODs..."
kubectl create -f prometheus-svc.yaml
kubectl create -f grafana-svc.yaml
kubectl create -f alertmanager-svc.yaml
#kubectl create -f node-exporter.yaml
kubectl create -f prometheus-rc.yaml
kubectl create -f grafana-rc.yaml
kubectl create -f alertmanager-rc.yaml
