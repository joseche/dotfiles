
PATH := $(PATH):/usr/local/bin

AP=ansible-playbook -i 'localhost,' -c local

all: textmode

textmode: ansible
	$(AP) ./textmode.yml

packages: ansible
	$(AP) ./packages.yml

extra-fonts: ansible
	$(AP) ./extra-fonts.yml

pip-system: ansible
	$(AP) ./pip-system.yml

graphicmode: ansible
	$(AP) ./graphicmode.yml

full: textmode packages pip-system graphicmode extra-fonts

ansible:
	which ansible 2>/dev/null || sudo dnf install -y ansible || sudo yum install -y epel-release ansible || sudo apt install -y ansible || brew install ansible
