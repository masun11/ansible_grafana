#!/bin/bash
export $(grep -v '^#' .env.grafana | xargs)
echo "GRAFANA_TOKEN before playbook: $GRAFANA_TOKEN"
ansible-playbook grafana_datasource_dashboard.yml
