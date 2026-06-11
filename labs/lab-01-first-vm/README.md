# 🧪 Lab 01: The First VM

## Objective
Create a virtual machine from scratch, mount the ISO image, install the operating system, and perform initial setup.

---

## Step by Step

1. **Download the ISO**
   Download **Ubuntu Server 24.04 LTS** from the official Canonical website.

2. **Create the VM**
   - Open VirtualBox and click **New**.
   - **Name:** `lab-ubuntu-server`.
   - **Memory:** 2048 MB.
   - **Processors:** 2 vCPUs.
   - **Virtual Hard Disk:** 25 GB, dynamic allocation.

3. **Mount the Media**
   - In the VM **Settings**, go to **Storage**.
   - Click on the "Empty" IDE controller.
   - In the right panel, click the optical disk icon and select the downloaded ISO file.

4. **Installation**
   - Start the VM. It will boot from the ISO.
   - Follow the Ubuntu installation steps (Language, Keyboard Layout, Network DHCP settings, and user/password creation).
   - When finished, the installer will ask to reboot.
   - In the VirtualBox menu: *Devices -> Optical Disks -> Remove disk from virtual drive*.

5. **Verification**
   Log in with your user and run:
   ```bash
   cat /etc/os-release
   ```
   It should display the Ubuntu Server 24.04 information.
