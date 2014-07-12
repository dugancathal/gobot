Vagrant.require_version ">= 1.6.3"

Vagrant.configure("2") do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.network "forwarded_port", guest: 9999, host: 9999

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.ssh.forward_agent = true
  config.vm.provision :shell, path: "install_components.sh", privileged: false
  config.vm.synced_folder ".", "/home/vagrant/gosource/src/github.com/arjunsharma/gobot"
end
