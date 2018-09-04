echo "Creating mount folder..."
sudo mkdir /var/lib/docker/containers/telemetry
sudo mkdir /var/lib/docker/containers/telemetry/provisioning
sudo mkdir /var/lib/docker/containers/telemetry/provisioning/dashboards
sudo mkdir /var/lib/docker/containers/telemetry/provisioning/datasources
echo "Copying configs..."
sudo cp prometheus.yml /var/lib/docker/containers/telemetry
sudo cp alertmanager.yml /var/lib/docker/containers/telemetry
sudo cp rules.yaml /var/lib/docker/containers/telemetry
sudo cp grafana.ini /var/lib/docker/containers/telemetry
sudo cp ldap.toml /var/lib/docker/containers/telemetry
sudo cp prometheus-datasource.yaml /var/lib/docker/containers/telemetry/provisioning/datasources
sudo cp node_metrics.json /var/lib/docker/containers/telemetry/provisioning/dashboards
sudo cp k8s_cluster.json /var/lib/docker/containers/telemetry/provisioning/dashboards
