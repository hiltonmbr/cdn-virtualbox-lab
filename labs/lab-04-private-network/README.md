# 🧪 Lab 04: Private Network of VMs

## Objective
Simulate a multi-tier architecture (e.g., Web Server + Database) that only communicate with each other. They must remain invisible and inaccessible to the rest of your home network and even to the Host (for maximum isolation).

---

## Step by Step

### 1. Creating the Infrastructure
Create two VMs with Ubuntu Server:
1. `web-server`
2. `db-server`

In the network settings of both, change **Adapter 1** to **Internal Network** and set the network name to `"isolated-network"`.

> Since they won't have NAT, they won't have internet access.

### 2. Setting Static IP
Since the Internal Network does not have a built-in DHCP server in VirtualBox, we need to assign IPs manually on each server.

**On the `web-server` VM:**
```bash
sudo ip addr add 10.50.0.10/24 dev enp0s3
sudo ip link set dev enp0s3 up
```

**On the `db-server` VM:**
```bash
sudo ip addr add 10.50.0.20/24 dev enp0s3
sudo ip link set dev enp0s3 up
```
*(Note: The adapter name `enp0s3` may vary. Check with `ip a`).*

### 3. Communication Test
From `web-server`, run:
```bash
ping 10.50.0.20
```

If the ping responds, the isolated internal network was successfully configured. No other machine on your network or your router itself knows these IPs exist.

To make this permanent after reboot on Ubuntu 24.04, modify the Netplan files (`/etc/netplan/*.yaml`).
