# Install dependencies from ``requirements.txt``
sudo pip3 install -r requirements.txt

# Copy ``inventory/sample`` as ``inventory/excle``
# cp -rfp inventory/sample inventory/excle

# Update Ansible inventory file with inventory builder
# declare -a IPS=(10.31.101.181 10.31.101.182 10.31.101.183 10.31.101.191 10.31.101.192 10.31.101.193 10.31.101.194)
# CONFIG_FILE=inventory/excle/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}

# Review and change parameters under ``inventory/excle/group_vars``
# cat inventory/excle/group_vars/all/all.yml
# cat inventory/excle/group_vars/k8s_cluster/k8s-cluster.yml

# Deploy Kubespray with Ansible Playbook - run the playbook as root
# The option `--become` is required, as for example writing SSL keys in /etc/,
# installing packages and interacting with various systemd daemons.
# Without --become the playbook will fail to run!

# Deploy
# sudo ansible-playbook -i inventory/excle/hosts.yaml  --become --become-user=root cluster.yml
# Adding new nodes to Kubespray 
# ansible-playbook -i inventory/excle/hosts.yaml  --become --become-user=root cluster.yml -l k8s-worker3
sudo ansible-playbook -i inventory/excle/hosts.yaml   -vv --flush-cache --become --become-user=root cluster.yml -l k8s-worker3
