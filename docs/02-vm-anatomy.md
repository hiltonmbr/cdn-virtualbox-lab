# 📍 2. VM Anatomy and Creation

When we create a VM, VirtualBox generates a folder containing the following main elements:

* **Configuration File (`.vbox`):** An XML file containing all hardware definitions for the VM (RAM size, vCPUs, boot order, network interfaces).
* **Virtual Hard Disk (`.vdi` - Virtual Disk Image):** The file that simulates the guest machine's HDD or SSD.

---

## 💾 `.vdi` Disk Types

### Dynamic Allocation
The `.vdi` file starts very small and grows dynamically as you install files on the guest system.
* **Advantage:** Saves space on your physical hard drive.
* **Recommendation:** Use for almost all academic and learning labs.

### Fixed Size
Allocates the full defined space on the Host immediately (e.g., creates a 25 GB file at once).
* **Advantage:** Offers slightly better read/write (I/O) performance.
* **Recommendation:** Use only for database benchmark tests or intense parallel processing with local Spark.

---

## ⚙️ Hardware Sizing (Recommendations)

| Resource | Minimum (Linux Server) | Minimum (Windows Desktop) |
|---|---|---|
| **RAM** | 1 GB to 2 GB | 4 GB |
| **vCPUs** | 1 to 2 vCPUs | 2 vCPUs |
| **Disk** | 10 GB to 25 GB | 50 GB |

> ⚠️ **Warning:** Avoid allocating more than 50% of your physical RAM or more than 50% of your physical processing cores, otherwise your own Host (your computer) will become slow and compromise overall performance.
