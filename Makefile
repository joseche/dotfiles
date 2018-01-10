all: ansible light

light:
	ansible-playbook -i 'localhost,' -c local ./light.yml

full:
	ansible-playbook -i 'localhost,' -c local ./full.yml

ansible:
	which ansible 2>/dev/null || sudo dnf install ansible || sudo yum install -y epel-release ansible || sudo apt install -y ansible || brew install ansible

