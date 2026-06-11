# 🧪 Lab 02: Isolated Database

## Objective
You want to test a PostgreSQL database on Linux without polluting your host operating system (Windows/macOS). The database client (DataGrip, DBeaver) installed on your *Host* needs to be able to connect to the VM reliably.

---

## Step by Step

### 1. Network Configuration
Create a VM with Ubuntu Server.
* In VirtualBox's network settings, change Adapter 1 from NAT to **Bridge Mode** (select your active Wi-Fi adapter) OR add an **Adapter 2** as **Host-Only** (preferred to avoid IP changes).

### 2. Finding the IP
Start the VM and run in the terminal:
```bash
ip addr show
```
Note the IP (e.g., `192.168.1.104` or `192.168.56.10`).

### 3. Installing PostgreSQL and Opening Access
```bash
# Install the database
sudo apt update && sudo apt install -y postgresql

# Configure PostgreSQL to listen for external connections
sudo sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/*/main/postgresql.conf

# Add connection permission on the network (Replace the subnet with yours)
echo "host all all 192.168.0.0/16 md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf

# Set the postgres user password
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'yourstrongpassword';"

# Restart the service
sudo systemctl restart postgresql
```

### 4. Connection from the Host
1. Open **DBeaver** or **DataGrip** on your Host computer.
2. Create a new PostgreSQL data source.
3. Fill in the details:
   * **Host:** `192.168.x.x` (VM's IP from Step 2)
   * **Port:** `5432`
   * **Database:** `postgres`
   * **User:** `postgres`
4. Click *Test Connection*.

**Success!** The database is isolated, yet fully accessible as if it were on your computer.
