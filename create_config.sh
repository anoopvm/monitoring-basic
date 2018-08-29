echo "Creating mount folder..."
sudo mkdir /var/lib/docker/containers/telemetry
echo "Copying configs..."
cp prometheus.yml /var/lib/docker/containers/telemetry
cp node_metrics.json /var/lib/docker/containers/telemetry
cp k8s_cluster.json /var/lib/docker/containers/telemetry

