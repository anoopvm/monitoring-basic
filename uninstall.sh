echo "Unlabeling the node for prometheus/grafana..."
kubectl label node $1 monitoring-
echo "Deleting PV..."
kubectl delete -f telemetry_pvc.yaml
echo "Deleting PVs..."
kubectl delete -f telemetry_pv.yaml
echo "Deleting PODs..."
kubectl delete -f prometheus-svc.yaml
kubectl delete -f grafana-svc.yaml
kubectl delete -f alertmanager-svc.yaml
kubectl delete -f node-exporter.yaml
kubectl delete -f prometheus-rc.yaml
kubectl delete -f grafana-rc.yaml
kubectl delete -f alertmanager-rc.yaml
