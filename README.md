# GoBot

A bot to serve up some sweet API functions

## Prerequisites

1. Vagrant 1.6.3 or newer
1. VirtualBox

## Starting with Vagrant

1. `git clone git@github.com:arjunsharma/gobot.git`
  * You will want to clone it into $GOPATH/src/github.com/arjunsharma/gobot, which will allow for your local IDE to correctly recognize the app's dependencies as valid syntax
1. `cd gobot`
1. [OPTIONAL] `./install_dependencies.sh` if you want to `go get` all of the app's dependencies locally
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

## Setting up the project

1. `vagrant ssh`
1. `cd $GOPATH/src/github.com/arjunsharma/gobot`
1. `./install_dependencies.sh`
1. `source defaults.env`
1. `go run main.go`
1. From your host machine, navigate your browser to `http://localhost:9999`
1. You should see the behavior defined by the root route handler!

## Running tests

1. Follow the Vagrant and project setup instructions
1. SSH into the Vagrant box and go to the project root directory
1. `gem install bundler`
1. `cd acceptance`
1. `bundle install`
1. `bundle exec rspec spec`
  * The spec helper will start up the server before the suite runs, and tear it down after the suite completes
  * If you prematurely interrupt the specs, run `ps aux | grep go` and make sure all Go processes have been killed

Once you have set everything up, you should be able to edit the code in your favorite editor, and run the app or its tests from the Vagrant box.

## Supported Routes

* `/pugs/random` - returns a random pug
* `/pugs/bomb/<COUNT>` - returns <COUNT> pugs

* `/kittens/random` - returns a random kitten
* `/kittens/bomb/<COUNT>` - returns <COUNT> kittens

* `/images/<QUERY>` - returns an image relating to <QUERY>
