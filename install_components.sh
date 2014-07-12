#!/bin/bash

print_step () {
  echo ""
  echo "#########################"
  echo "   ${1}"
  echo "#########################"
  echo ""
}

print_step "Update apt"
sudo apt-get update
sudo apt-get upgrade

print_step "Install build-essential, curl, git, and mercurial"
sudo apt-get install build-essential curl git mercurial -y

print_step "Install rbenv"
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv

echo 'PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
PATH=$HOME/.rbenv/bin:$PATH
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$HOME/.rbenv/bin/rbenv init -

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
PATH=$HOME/.rbenv/plugins/ruby-build/bin:$PATH


print_step "Install Ruby 2.1.2"
$HOME/.rbenv/bin/rbenv install 2.1.2
$HOME/.rbenv/bin/rbenv global 2.1.2

print_step "Install Go"
sudo apt-get install golang -y

print_step "Setup Go"
sudo mkdir $HOME/gosource/bin
sudo chown -R vagrant:vagrant $HOME/gosource

echo 'export GOPATH="$HOME/gosource"' >> ~/.bashrc
echo 'export GOBIN="$HOME/gosource/bin"' >> ~/.bashrc
echo 'PATH=$GOBIN:$PATH' >> ~/.bashrc
echo "DONE!"
