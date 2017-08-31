all:
	which ansible 2>/dev/null || sudo yum install -y epel-release ansible || sudo apt install -y ansible || brew install ansible
	ansible-playbook -i 'localhost,' -c local playbook.yml
