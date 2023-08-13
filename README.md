# Change these of ansible/aws_inventory/group_vars/aws_ec2.yml
db_host: "db-endpoints"
web_host: "server-ip-addr"

# Instead of asking user password, .password file is created and password is stored 
To run playbook book use,
ansible-playbook --vault-id .password site.yml


# If you want to decrypt encrypted variables, use
ansible-vault encrypt <path-to-vars-file>

Vault password: P@ssword0
