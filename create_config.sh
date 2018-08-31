echo "Creating mount folder..."
sudo mkdir /var/lib/docker/containers/telemetry
echo "Copying configs..."
sudo cp prometheus.yml /var/lib/docker/containers/telemetry
sudo cp alertmanager.yml /var/lib/docker/containers/telemetry
sudo cp rules.yaml /var/lib/docker/containers/telemetry

