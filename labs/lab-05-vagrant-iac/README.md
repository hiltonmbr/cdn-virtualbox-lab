# 🧪 Lab 05: Vagrant and IaC

## Objective
Build a functional Apache web server running on a 100% code-provisioned VM in minutes, without touching the VirtualBox interface.

---

## Step by Step

### 1. Preparation
Create a folder on your Host computer:
```bash
mkdir lab-webserver
cd lab-webserver
```

### 2. The Vagrantfile
Create a file named `Vagrantfile` inside the folder with the following content:

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.network "forwarded_port", guest: 80, host: 8080

  # Provisioning script to run as soon as the VM boots
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y apache2
    echo "<h1>Working Vagrant Lab</h1>" > /var/www/html/index.html
  SHELL
end
```

### 3. Execution
In the terminal (from the same folder as the `Vagrantfile`), run:
```bash
vagrant up
```
Vagrant will:
1. Download the Ubuntu image (if it's the first time).
2. Create the VM in VirtualBox.
3. Configure NAT networking and port forwarding on port 8080.
4. Run the shell script (Apache installation).

### 4. Final Test
Open your browser on your own PC and go to:
`http://localhost:8080`

You will see the page **Working Vagrant Lab**, magically hosted on the virtual machine, all managed through code!
