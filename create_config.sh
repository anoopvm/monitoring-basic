echo "Creating mount folder..."
sudo mkdir /var/lib/docker/containers/telemetry
echo "Copying configs..."
sudo cp prometheus.yml /var/lib/docker/containers/telemetry
sudo cp node_metrics.json /var/lib/docker/containers/telemetry
sudo cp k8s_cluster.json /var/lib/docker/containers/telemetry

