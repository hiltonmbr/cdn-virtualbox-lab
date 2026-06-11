# 📍 1. Fundamentals and Installation

## 📦 What is VirtualBox?

**VirtualBox** is a powerful free and open-source (GPLv2) x86/AMD64 virtualization product, maintained by Oracle. It is the most popular Type 2 Hypervisor in the world for development and education.

**Type 2 Hypervisor (Hosted):** Installed **on top of your Operating System** (the *Host*). It intercepts the guest OS calls to the physical hardware and translates them, creating a perfect illusion of a separate machine.

### Why VirtualBox?
* **Free** for personal and educational use.
* **Cross-platform**: Identical behavior on Windows, macOS, and Linux.
* **VBoxManage**: Command-line API to automate the creation and management of VMs via scripts.

---

## 💻 Installation

### 🪟 Microsoft Windows
Download from: [virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
* Run the `.exe` installer and follow the standard wizard.
* **Common conflict:** If VirtualBox fails to start VMs, disable Windows **Hyper-V**.

### 🍎 Apple macOS (Intel)
* Mount the `.dmg` file and run the `.pkg` installer.
* **Security:** You will need to approve the Oracle "System Extensions" in macOS *Privacy & Security* settings.

### 🐧 Linux (Ubuntu/Debian)
```bash
sudo apt update
sudo apt install virtualbox virtualbox-ext-pack
# Add your user to the group to use USB devices
sudo usermod -aG vboxusers $USER
```

---

## ⚙️ VirtualBox Extension Pack

The **Extension Pack** is an essential package downloaded separately from the official website. It enables:
* **USB 2.0 and 3.0 Support:** Allows passing flash drives or Wi-Fi adapters to the VM.
* **VirtualBox RDP:** Remote access to the VM console using standard RDP clients.
* **Disk Encryption:** Protects `.vdi` files.

> ⚠️ **Golden Tip:** Always keep the Extension Pack at the exact same version as the installed VirtualBox.
