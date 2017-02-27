# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024 #change this to the amount of memory to dedicate, in MB.
    v.cpus = 2      #change this to the number of CPU cores to dedicate.
                    #They must be less than or equal to the number available on the host machine.
  end

  config.vm.box = "ubuntu/xenial64"
  config.vm.provision :shell, path: "scripts/bootstrap.sh"
  config.vm.provision :shell, path: "scripts/user.sh", privileged: false
  # config.vm.provision :shell, path: "scripts/run.sh", privileged: false, run: 'always'
  config.vm.synced_folder "./data", "/data", type: "virtualbox"
  config.vm.synced_folder "./notebooks", "/home/ubuntu/notebooks", type: "virtualbox"
  config.vm.network "private_network", ip: "172.16.11.11"
  config.vm.network "forwarded_port", guest: 8888, host: 8888

end
