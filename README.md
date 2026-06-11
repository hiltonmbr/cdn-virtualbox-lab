# 📦 VirtualBox Lab

### **Complete hands-on Oracle VM VirtualBox tutorial**
From zero to local lab automation with the world's most popular Type 2 Hypervisor.

![VirtualBox](https://img.shields.io/badge/VirtualBox-7.x-1868CE?logo=virtualbox&logoColor=white)
![Vagrant](https://img.shields.io/badge/Vagrant-Automated_VMs-1563FF?logo=vagrant&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-24.04_LTS-E95420?logo=ubuntu&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 🎯 What is this repository?

A **hands-on lab** for learning Local Virtualization with VirtualBox. Ideal for Data Science, Engineering, and IT students who need to create complex environments (like clusters and servers) on their own computers without formatting them.

Each concept is taught with:

- 📖 **Rich documentation** — detailed explanations about virtual disks, networks, and Host integration.
- 🧪 **Practical labs** — step-by-step setups, including isolated databases and network simulations.
- 📜 **Automation examples** — Infrastructure as Code using Vagrant to quickly provision VMs.

> **Target audience:** Professionals and students who need to run databases, Spark/Hadoop clusters, and Linux environments from Windows or macOS machines.

---

## ⚡ Quick Start (5 minutes)

If you already have VirtualBox and Vagrant installed, you can spin up your first automated VM right now:

```bash
# 1. Create a test directory
mkdir lab-test && cd lab-test

# 2. Initialize a basic Vagrant environment with Ubuntu Server
vagrant init ubuntu/focal64

# 3. Start the virtual machine (VirtualBox handles everything in the background)
vagrant up

# 4. Access the machine via SSH
vagrant ssh

# 5. Inside the VM, check the OS
cat /etc/os-release
```

**Congratulations!** 🎉 You've just provisioned and accessed a full Linux server inside your computer.

> 🖥️ **Don't have VirtualBox installed or prefer the GUI?** Start with the [installation documentation](docs/01-installation-and-fundamentals.md).

---

## ⚙️ Prerequisites

| Requirement | Details |
|---|---|
| **Computer (Host)** | Laptop or Desktop with Windows, Linux, or macOS (Intel)* |
| **CPU** | AMD (AMD-V) or Intel (VT-x) processor with virtualization enabled in BIOS/UEFI |
| **RAM** | Minimum 8 GB (recommended: 16 GB+ for running multiple VMs smoothly) |
| **Disk** | 20 GB to 50 GB free for allocating virtual disks (`.vdi`) |
| **Images (ISO)** | ISO file of a system (e.g., Ubuntu Server 24.04 LTS) |

> ⚠️ **macOS Users (Apple Silicon M1/M2/M3/M4):** VirtualBox has limitations on ARM processors. For Apple Silicon MacBooks, we recommend using **UTM** (QEMU) or **Parallels Desktop** with ARM64 images.

---

## 🗺️ Learning Map

The content is organized into **conceptual documentation** + **practical labs**:

### 📖 Documentation

| # | Module | Topics | Link |
|---|---|---|---|
| 01 | **Fundamentals & Installation** | Type 2 Hypervisor, Extension Pack, Hardware, VBox vs Proxmox | [📖 Read](docs/01-installation-and-fundamentals.md) |
| 02 | **VM Anatomy** | `.vbox` and `.vdi` files, dynamic vs fixed disks | [📖 Read](docs/02-vm-anatomy.md) |
| 03 | **Network Modes** | NAT, Bridge, Host-Only, Internal Network, dual interface | [📖 Read](docs/03-network-modes.md) |
| 04 | **Advanced Tools** | Snapshots and Guest Additions (Host-Guest integration) | [📖 Read](docs/04-advanced-tools.md) |
| 05 | **Vagrant Automation** | Vagrantfile, provisioning, basic IaC for dev environments | [📖 Read](docs/05-vagrant-automation.md) |

### 🧪 Practical Labs

| # | Lab | Approach | What it does | Time | Link |
|---|---|---|---|---|---|
| 01 | **The First VM** | Basic | Create an Ubuntu Server VM from scratch via GUI, mount ISO | 20 min | [🧪 Go](labs/lab-01-first-vm/README.md) |
| 02 | **Isolated Database** | Intermediate | VM with PostgreSQL connected to Host (DataGrip/DBeaver) via Bridge/Host-Only | 30 min | [🧪 Go](labs/lab-02-isolated-database/README.md) |
| 03 | **Simulating a Disaster** | Administration | Break the native Python and instantly recover it with Snapshots | 15 min | [🧪 Go](labs/lab-03-disaster-test/README.md) |
| 04 | **Private VM Network** | Advanced | Isolate a Web server and a DB server on an Internal Network | 40 min | [🧪 Go](labs/lab-04-private-network/README.md) |
| 05 | **Vagrant and IaC** | DevOps | Spin up and configure reproducible environments without touching the VBox GUI | 25 min | [🧪 Go](labs/lab-05-vagrant-iac/README.md) |

---

## 📂 Repository Structure

```text
cdn-virtualbox-lab/
│
├── 📖 docs/                                 # Conceptual documentation
│   ├── 01-installation-and-fundamentals.md
│   ├── 02-vm-anatomy.md
│   ├── 03-network-modes.md
│   ├── 04-advanced-tools.md
│   └── 05-vagrant-automation.md
│
├── 🧪 labs/                                 # Guided hands-on exercises
│   ├── lab-01-first-vm/
│   ├── lab-02-isolated-database/
│   ├── lab-03-disaster-test/
│   ├── lab-04-private-network/
│   └── lab-05-vagrant-iac/
│
├── 📜 scripts/                              # Helper scripts and examples
│   └── setup-host-only.sh
│
├── 📋 .gitignore                            # Heavy files omitted (ISO/VDI)
├── 📋 Makefile                              # Automation commands
├── 📋 LICENSE                               # MIT License
├── 📋 CONTRIBUTING.md                       # Contribution guide
└── 📋 README.md                             # ← You are here
```

---

## 🔑 Key Concepts

| Concept | Description |
| :--- | :--- |
| **🖥️ Type 2 Hypervisor** | Unlike Proxmox, VirtualBox runs **on top of** your operating system (Windows/Mac/Linux). It is a "Hosted Hypervisor". |
| **💾 .vdi (Virtual Disk Image)** | VirtualBox's default disk format. Can be *Dynamic Allocation* (grows on demand) or *Fixed Size* (better I/O). |
| **🌐 NAT (Default)** | The VM accesses the internet "hidden" behind the Host. The Host **cannot** easily access it (useful only for browsing and downloading packages). |
| **🌐 Bridge Mode** | The VM connects directly to the Host's physical adapter (Wi-Fi/Cable). It receives an IP from your router, like a new computer on your home network. |
| **🌐 Host-Only Network** | Creates a virtual adapter on the Host directly connected to the VM. Perfect for maintaining a stable SSH connection from your laptop to the VM, but without internet on the VM. |
| **📸 Snapshots** | The "time machine". Freezes the exact state of the VM (RAM and Disk) allowing immediate rollback. Ideal to use before dangerous configurations. |
| **🎁 Guest Additions** | Driver package installed **inside** the VM. Enables fluid screen resizing, clipboard (Copy/Paste), and shared folders. |
| **🤖 Vagrant** | HashiCorp tool for building and maintaining reproducible virtual environments through declarative files (`Vagrantfile`). |

---

## 📝 Quick Cheatsheet (VBoxManage and Vagrant)

```bash
# ══════════════════════════════════════════════
#  📋 VIRTUALBOX & VAGRANT — CHEATSHEET
# ══════════════════════════════════════════════

# ── VBoxManage (Official VirtualBox CLI) ──
vboxmanage list vms                            # List all created VMs
vboxmanage list runningvms                     # List running VMs
vboxmanage startvm "VM-Name" --type headless   # Start VM without GUI (background)
vboxmanage controlvm "VM-Name" poweroff        # Force shut down the VM
vboxmanage snapshot "VM-Name" take "Backup"    # Create a VM snapshot
vboxmanage snapshot "VM-Name" restore "Backup" # Restore the snapshot

# ── Vagrant (IaC for VirtualBox) ──
vagrant init ubuntu/focal64                    # Create a Vagrantfile with Ubuntu 20.04
vagrant up                                     # Download the image (if needed) and start the VM
vagrant ssh                                    # Access the provisioned VM via SSH
vagrant halt                                   # Shut down the VM gracefully
vagrant reload                                 # Reboot the VM (applying changes)
vagrant destroy -f                             # Delete the VM and free all resources
vagrant status                                 # Show the current environment status
```

---

## 📚 References

- [Oracle VM VirtualBox User Manual](https://www.virtualbox.org/manual/UserManual.html) — Comprehensive official documentation.
- [Vagrant — VirtualBox Provider](https://developer.hashicorp.com/vagrant/docs/providers/virtualbox) — Environment automation.
- SILBERSCHATZ, A.; GALVIN, P. B.; GAGNE, G. **Operating System Concepts**. 10th ed. Wiley, 2018. Ch. 18.

---

## 📄 License

This material is for educational use. Created for the **Data Science for Business** course — UFPB.

---

> **📦 The Personal Lab: Test complete Big Data infrastructures from the comfort of your laptop, without fear of breaking anything.**
