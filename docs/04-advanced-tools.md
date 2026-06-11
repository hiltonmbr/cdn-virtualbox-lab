# 📍 4. Advanced Tools

## 📸 Snapshots: The Time Machine

A **Snapshot** freezes the exact state of your virtual machine at that moment. If the VM breaks in the future, you can restore it instantly.

> Think of a snapshot as saving a video game before facing a "boss fight". If you fail, just reload the save point.

### ✅ When to take a Snapshot:
* Before performing critical updates (`apt upgrade` or `dist-upgrade`).
* Before installing experimental packages, compiling kernels, or complex Big Data tools.
* As soon as you finish a clean OS installation ("Golden Image").

### ⚠️ Important caveats:
* **Not a Backup:** If your physical disk fails, you lose the VM and all Snapshots.
* **Disk Space:** Each snapshot creates "differential" files (chained `.vdi` files) that grow indefinitely over time.
* **Performance:** Long snapshot chains severely impact VM disk I/O speed. Remove old consolidated snapshots!

---

## 🎁 Guest Additions: The Smooth Experience

**Guest Additions** is a package of utilities and drivers that runs inside the guest system, improving integration with the Host.

| Feature | Without Guest Additions | With Guest Additions |
|---|---|---|
| **Mouse Integration** | Cursor "trapped" in the VM window | Free movement between screens |
| **Clipboard** | Isolated with no communication | Bidirectional (Copy/Paste) |
| **Screen Resolution** | Fixed resolutions (e.g., 800x600) | Dynamic fluid resizing |
| **Shared Folders** | Requires complex network setup (NFS/SMB) | Direct access to Host folders |

### Installing Guest Additions on Ubuntu Server (headless)

Since we don't have a GUI to "click on the installer", we'll do it via terminal:

```bash
# 1. Install build dependencies
sudo apt update && sudo apt install -y build-essential dkms linux-headers-$(uname -r)

# 2. In VirtualBox: Devices menu -> Insert Guest Additions CD image...

# 3. Mount and run
sudo mount /dev/cdrom /media
sudo /media/VBoxLinuxAdditions.run

# 4. Reboot the VM to load the new modules
sudo reboot
```
