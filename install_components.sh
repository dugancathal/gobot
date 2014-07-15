#!/bin/bash

print_step () {
  echo ""
  echo "#########################"
  echo "   ${1}"
  echo "#########################"
  echo ""
}

print_step "Updating apt"
sudo apt-get update
sudo apt-get upgrade

print_step "Installing build-essential, curl, git, and mercurial"
sudo apt-get install build-essential curl git mercurial -y

print_step "Authenticating with GitHub"
ssh -o "StrictHostKeyChecking no" -T git@github.com

print_step "Installing rbenv"
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv

echo 'PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$HOME/.rbenv/bin/rbenv init -

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

print_step "Installing Ruby 2.1.2"
$HOME/.rbenv/bin/rbenv install 2.1.2
$HOME/.rbenv/bin/rbenv global 2.1.2

print_step "Installing Go"
sudo apt-get install golang -y

print_step "Creating go/bin directory"
sudo mkdir $HOME/gosource/bin

print_step "Chowning GOPATH directory"
sudo chown -R vagrant:vagrant $HOME/gosource

print_step "Exporting GOPATH, GOBIN, and modifying PATH"
echo 'export GOPATH="$HOME/gosource"' >> ~/.bashrc
echo 'export GOBIN="$HOME/gosource/bin"' >> ~/.bashrc
echo 'PATH=$GOBIN:$PATH' >> ~/.bashrc

print_step "DONE!"
