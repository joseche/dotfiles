all: light

light: ansible
	ansible-playbook -i 'localhost,' -c local ./light.yml

packages: ansible light
	ansible-playbook -i 'localhost,' -c local ./packages.yml

fonts: ansible
	ansible-playbook -i 'localhost,' -c local ./fonts.yml

pip: ansible
	ansible-playbook -i 'localhost,' -c local ./pip-pydev.yml

ansible:
	which ansible 2>/dev/null || sudo dnf install ansible || sudo yum install -y epel-release ansible || sudo apt install -y ansible || brew install ansible

