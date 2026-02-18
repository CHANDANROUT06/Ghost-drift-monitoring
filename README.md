# Ghost-drift-monitoring



# Ghost in the Machine – Configuration Drift & Self-Healing System

## Overview
This project demonstrates Configuration Drift detection and a Self-Healing Infrastructure using Docker containers and automation scripts.

Two identical web servers (web1, web2) run Nginx.  
If configuration drift occurs (e.g., Nginx stops or breaks), the system automatically detects and restores the desired state.

---

## Features
- Drift Detection (detect_drift.sh)
- Self-Healing System (autoheal.sh)
- Continuous Monitoring (monitor.sh)
- One-command Demo (demo.sh)
- Drift Logging (drift.log)
- Zombie-process safe detection
- Immutable Infrastructure simulation

---

## Architecture
User → Monitoring Script → Drift Detection → Auto-Heal → Restore Desired State

---

## How It Works
1. Two containers run identical Nginx servers.
2. If Nginx stops → Drift occurs.
3. Drift detection script identifies mismatch.
4. Auto-heal script restarts Nginx automatically.
5. System returns to healthy state.

---

## Run Demo

```bash
chmod +x *.sh
./demo.sh
