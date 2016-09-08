# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing! ⚠
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Development VM 🍳
  config.vm.define 'dev', primary: true do |dev|
    dev.vm.box = 'ubuntu/trusty64'

    config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '1024', '--cpus', '2']
    end

    dev.vm.provision 'ansible' do |ansible|
      ansible.playbook = 'cm/ansible/provisioning/dev.yml'
    end

    config.vm.network 'forwarded_port', guest: 3000, host: 3000

    # PostgreSQL Server port forwarding
    config.vm.network :forwarded_port, host: 5555, guest: 5432
    config.vm.synced_folder './', '/home/vagrant/semantics'
  end

  if Vagrant.has_plugin?('vagrant-cachier')
    config.cache.scope = :box
  else
    puts 'Run `vagrant plugin install vagrant-cachier` to reduce caffeine intake when provisioning'
  end
end