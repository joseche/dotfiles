#!/bin/sh

sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get -y update
sudo apt install -y atom

which apm 2>/dev/null && ruby -e '%w{
autocomplete-go
builder-go
environment
figletify
git-plus
go-plus
language-chef
language-hcl
language-puppet
language-terraform
language-viml
linter
linter-foodcritic
linter-puppet
minimap
navigator-godef
pretty-json
}.each do |c|
  cmd = "apm install #{c}"
  %x( #{cmd} )
end'

