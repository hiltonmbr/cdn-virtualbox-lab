# 📍 3. VirtualBox Network Modes

Understanding networks is the difference between a lab that works and one that fails. VirtualBox offers several modes:

| Mode | Can the VM access the Internet? | Can the Host access the VM? | Can VMs communicate? | Typical use |
|---|---|---|---|---|
| **NAT** | ✅ Yes | ❌ No | ❌ No | Basic browsing |
| **Bridge** | ✅ Yes | ✅ Yes | ✅ Yes | VM as a LAN server |
| **Host-Only** | ❌ No | ✅ Yes | ✅ Yes | Private Host-VM network |
| **Internal** | ❌ No | ❌ No | ✅ Yes | Isolated VM cluster |

---

## 🔸 NAT (Default)

The VM is hidden behind a virtual router (VirtualBox). It receives an IP like `10.0.2.15`.
* **How it works:** Translates VM traffic using the Host IP.
* **Advantage:** Immediate internet access without configuration.
* **Limitation:** The Host cannot access services on the VM directly (requires *Port Forwarding*).

## 🔹 Bridge

The VM connects directly to the Host's physical adapter (Wi-Fi/Ethernet).
* **How it works:** Your home's physical router assigns an IP to the VM (e.g., `192.168.1.50`).
* **Advantage:** Direct and transparent connectivity. The VM looks like a real phone or PC on the network.
* **Limitation:** Depends on an active DHCP server on the physical network and may fail on corporate Wi-Fi networks.

## 🟢 Host-Only

Creates a virtual network adapter on the Host (e.g., `vboxnet0`) connected to the VM.
* **How it works:** Direct IP communication between Host and VM (e.g., `192.168.56.x`).
* **Advantage:** The VM is not exposed to the internet, but the Host can SSH into it incredibly stably (does not drop if Wi-Fi disconnects).
* **Limitation:** No internet access on the VM.

## 🔴 Internal Network

Creates an isolated virtual switch connecting only the VMs.
* **How it works:** Direct communication only between VMs sharing the same "network name".
* **Advantage:** Full isolation from the Host and internet — perfect for simulating isolated datacenters or safely testing malware.
* **Limitation:** Requires manual IP and route configuration on the VMs.

---

### 💡 The Professional Technique (Dual Interface)

To get the best of both worlds, many administrators use a **dual network adapter** setup:
* **Adapter 1 (NAT):** Enables the VM to download packages, updates, and access external services.
* **Adapter 2 (Host-Only):** Creates a fixed, secure network channel for developers to make SSH connections or connect to the database (e.g., Postgres/Spark) on the VM without relying on unstable Wi-Fi connections.
