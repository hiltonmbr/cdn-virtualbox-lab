# 📍 5. Automation with Vagrant

Creating virtual machines by clicking through VirtualBox's graphical wizards (selecting ISO, allocating RAM, waiting for the installation to run) can become a slow and repetitive task, especially when environments break frequently during Big Data tests.

**Vagrant** allows you to create environments through code (Infrastructure as Code - IaC).

## 🤖 How does it work?

Vagrant reads a file called `Vagrantfile` (written in Ruby) and silently orchestrates VirtualBox (in the background) to download pre-built images, configure networks, folders, and start the VM in minutes.

## 📄 The Basic Vagrantfile

```ruby
Vagrant.configure("2") do |config|
  # Machine image (Box)
  config.vm.box = "ubuntu/focal64"

  # Network Configuration: Port Forwarding
  # Forwards port 8080 on your PC to port 80 on the VM
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Network Configuration: Static IP
  config.vm.network "private_network", ip: "192.168.33.10"

  # VirtualBox hardware settings
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.cpus = 2
  end
end
```

## 📝 Essential Commands

* `vagrant up` — Starts and provisions the environment for the first time.
* `vagrant ssh` — Accesses the VM terminal via SSH without passwords.
* `vagrant halt` — Safely shuts down the VM.
* `vagrant destroy` — Completely deletes the VM and its disks.
