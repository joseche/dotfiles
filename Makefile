
PATH := $(PATH):/usr/local/bin


all: light


light: ansible
	ansible-playbook -i 'localhost,' -c local ./light.yml

packages: ansible
	ansible-playbook -i 'localhost,' -c local ./packages.yml

extra_fonts: ansible
	ansible-playbook -i 'localhost,' -c local ./extra_fonts.yml

pip_system: ansible
	ansible-playbook -i 'localhost,' -c local ./pip_system.yml

graphicmode: ansible:
	ansible-playbook -i 'localhost,' -c local ./graphicmode.yml

full: light packages pip_system graphicmode extra_fonts

ansible:
	which ansible 2>/dev/null || sudo dnf install -y ansible || sudo yum install -y epel-release ansible || sudo apt install -y ansible || brew install ansible
