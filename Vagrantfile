# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |vb|
    vb.customize ['modifyvm', :id, '--memory', '1024', '--ioapic', 'on']
  end
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end
  config.vm.define :salt_master do |master|
    master.vm.host_name = 'salt-master'
    master.vm.network :private_network, ip: '192.168.33.101'

    master.vm.provision "shell", inline: <<-SHELL
       sudo locale-gen zh_TW.UTF-8
       sudo add-apt-repository ppa:saltstack/salt -y
       sudo apt-get update
       sudo apt-get install salt-master git -y
       printf 'file_roots: \n  base:\n    - /srv/salt\nauto_accept: True\n' | sudo tee -a /etc/salt/master
       mkdir -p /srv/salt
       cp -r /vagrant/srv/* /srv/
       sudo service salt-master restart
    SHELL
  end

  config.vm.define :ci do |ci|
    ci.vm.host_name = 'ci-prd-vag'
    ci.vm.network :private_network, ip: '192.168.33.102'

    ci.vm.provision "shell", inline: <<-SHELL
     sudo locale-gen zh_TW.UTF-8
     sudo add-apt-repository ppa:saltstack/salt -y
     sudo apt-get update
     sudo apt-get install salt-minion  -y
     echo -n "192.168.33.101 salt" | sudo tee -a /etc/hosts
    SHELL
  end
  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
