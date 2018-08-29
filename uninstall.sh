echo "Unlabeling the node for prometheus/grafana..."
kubectl label node &1 monitoring-
echo "Deleting mount folder..."
sudo rm -rf /var/lib/docker/containers/telemetry
echo "Deleting PV..."
kubectl delete -f telemetry_pv.yaml
echo "Deleting PVs..."
kubectl delete -f telemetry_pvc.yaml
echo "Deleting PODs..."
kubectl delete -f node-exporter.yaml
kubectl delete -f prometheus-rc.yaml
kubectl delete -f grafana-rc.yaml

