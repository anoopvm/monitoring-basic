# monitoring-basic

### CONFIG ###
# prometheus.yml
# update the *alerting* config with host-name or IP where alertmanager is deployed (this will be the node which is labelled in next step)
# Update *target_groups* with the node-exporter and kubernetes exporter IP (maybe node1, node2, node3)

# alertmanager.yml
# update the *webhook_configs* config with the XOC API endpoint to which the http request to be sent when the trigger(alert) happens

### DEPLOYMENT ###
# checkout repo on worker node
# create_config.sh

# checkout the repo on master.
# node-name as in kubectl get nodes output
# install.sh <node-name>

### UNINSTALL ###
# worker node
# delete_config.sh <node-name>

# master node
# uninstall.sh

### TODO: Grafana setup ###
# data source
# username/password
# dashboards