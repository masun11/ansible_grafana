# Ansible Grafana Automation

This project helps automate Grafana dashboard and datasource provisioning using Ansible.

## 📦 Clone the repository

```bash
git clone https://github.com/masun11/ansible_grafana.git
cd ansible_grafana

🚀 How to Set Up
1️⃣ Create a Service Account in Grafana
curl -X 'POST' \
  'http://admin:admin@localhost:3000/api/serviceaccounts' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
    "isDisabled": false,
    "name": "sa_admin",
    "role": "Admin"
}'
✅ Example Output:
{
  "id": 5,
  "uid": "ferl3qxr2eo74c",
  "name": "sa_masun",
  "login": "sa-1-sa_admin",
  "orgId": 1,
  "isDisabled": false,
  "role": "Admin",
  "tokens": 0,
  "avatarUrl": ""
}

2️⃣ Create an API Token for the Service Account
Replace 5 with the id from the output above:
curl -X 'POST' \
  'http://admin:admin@localhost:3000/api/serviceaccounts/5/tokens' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
    "name": "grafana_api_key",
    "secondsToLive": 0
}'
✅ Example Output:
{
  "id": 2,
  "name": "grafana_api_key",
  "key": "***************************"
}

3️⃣ Test the Token
export GRAFANA_TOKEN=*************************
curl -X GET http://localhost:3000/api/org \
  -H "Authorization: Bearer $GRAFANA_TOKEN"

4️⃣ Save the Token in .env.grafana
echo GRAFANA_TOKEN=*************************** > .env.grafana

▶️ Run the Ansible Playbook
sh run.sh

This will apply the Ansible playbook using the exported token and provision dashboards/datasources into Grafana.


