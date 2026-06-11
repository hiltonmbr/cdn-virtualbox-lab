# 🧪 Lab 03: Disaster Test with Snapshots

## Objective
You need to perform a risky Python upgrade procedure that could break essential Linux dependencies. We will use Snapshots to run the test safely.

---

## Step by Step

### 1. Create the Restore Point
1. With the VM powered off or paused, go to the VirtualBox Manager.
2. Select the **Snapshots** tab and click **Take**.
3. Name: `"Before Python 3.12 Upgrade"`.

### 2. Simulate the Critical Failure
Start the VM and run destructive commands (removing the system's base Python):
```bash
sudo rm -rf /usr/bin/python3
```
*Result:* Various Linux dependencies stop working immediately (e.g., the `apt` utility breaks, commands fail). The system may become inoperable.

### 3. Instant Restore (Post-Disaster Recovery)
1. Force shut down the VM (click the close window button -> *Power off the machine*).
2. Go back to the **Snapshots** tab in the VirtualBox Manager.
3. Click on `"Before Python 3.12 Upgrade"` -> select **Restore**.
4. Start the VM again.

**Verification ✅**
The machine boots up in seconds with all native Python files perfectly restored. The disaster was avoided without needing to reinstall the OS!
