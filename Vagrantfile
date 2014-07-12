Vagrant.require_version ">= 1.6.3"

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.network "forwarded_port", guest: 9999, host: 9999

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision :shell, path: "install_components.sh", privileged: false

  config.vm.synced_folder "#{ENV["HOME"]}/workspace/gobot", "/home/vagrant/gosource/src/github.com/arjunsharma/gobot"
end
