# -*- mode: ruby -*-
# vi: set ft=ruby :

vagrant_plugins = ['vagrant-librarian-puppet', 'vagrant-puppet-install']

for plugin in vagrant_plugins
  unless Vagrant.has_plugin?("#{plugin}")
    system("vagrant plugin install #{plugin}")
    puts("#{plugin} installed")
  end
end

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.box = "puppetlabs/centos-7.2-64-nocm"
  config.vm.box_url = "https://vagrantcloud.com/puppetlabs/boxes/centos-7.2-64-nocm"

  config.puppet_install.puppet_version = "3.7.5"

  config.vm.define "default" do |default|
    default.librarian_puppet.puppetfile_dir = 'puppet'
    default.librarian_puppet.placeholder_filename = ".gitkeep"
    default.librarian_puppet.resolve_options = { :force => true }
    default.librarian_puppet.destructive = false

    default.vm.provision :puppet do |puppet|
      puppet.environment_path = "puppet/environments"
      puppet.environment = "default"
      puppet.module_path = "puppet/modules"
      puppet.manifests_path = "puppet/manifests"
      puppet.manifest_file= "site.pp"
    end
  end

  config.vm.network "forwarded_port", guest: 8080, host: 8080

end
