all: ansible user server

user:
	ansible-playbook -i 'localhost,' -c local ./user.yml

server:
	ansible-playbook -i 'localhost,' -c local ./server.yml

ansible:
	which ansible 2>/dev/null || sudo yum install -y epel-release ansible || sudo apt install -y ansible || brew install ansible

