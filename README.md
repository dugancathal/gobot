# GoBot

A bot to serve up some sweet API functions

## Prerequisites

1. Vagrant 1.6.3 or newer
1. Virtualbox

## Get set up for development

1. `git clone git@github.com:arjunsharma/gobot.git`
1. `cd gobot`
1. `vagrant up`, which creates a VM with Ubuntu 14.04, 2 CPUs, and 2GB of RAM, and does the following:
  * Forwards port 9999 on the VM to 9999 on the host
  * Syncs the project folder to `$HOME/gosource/src/github.com/arjunsharma/gobot`
  * Runs the installation script for all development and production dependencies
1. The installation script will do the following:
  * Update apt
  * Install build-essential, curl, git, and mercurial
  * Authenticate you with GitHub
  * Install rbenv and ruby (for acceptance tests)
  * Install Go
  * Set your `GOBIN` at `$HOME/gosource/bin`
  * Set your `GOPATH` at `$HOME/gosource`
  * Setup the VM's `.bashrc`

## After setting up Vagrant

1. `vagrant ssh`
1. `cd $GOPATH/src/github.com/arjunsharma/gobot`
1. `go run main.go`
1. From your host machine, navigate your browser to `http://localhost:9999`
1. You should see the behavior defined by the root route handler!

Once you have set everything up, you should be able to edit the code in your favorite editor, and run the app or its tests from the vagrant box.
