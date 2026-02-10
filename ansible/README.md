# Ansible Quick Start Guide

## Prerequisites

1. Install Ansible on your local machine:
   ```bash
   # macOS
   brew install ansible

   # Ubuntu/Debian
   sudo apt update && sudo apt install -y ansible
   ```

2. Generate SSH key (if you don't have one):
   ```bash
   ssh-keygen -t ed25519 -C "your_email"
   ```

3. Copy your SSH key to the VM:
   ```bash
   ssh-copy-id your_user@vm_ip
   ```

## Setup

1. Edit `inventory.ini`:
   ```ini
   [all]
   rtiodev-vm ansible_host=YOUR_VM_IP ansible_user=YOUR_USER ansible_ssh_private_key_file=~/.ssh/id_ed25519
   ```

2. Test connection:
   ```bash
   ansible -i inventory.ini all -m ping
   ```

## Run the Playbook

```bash
ansible-playbook -i inventory.ini hardening.yml
```

## What It Does

- Updates packages
- Installs & configures ufw (firewall)
- Hardens SSH (key-only, no root)
- Fixes OpenClaw credentials perms
- Installs fail2ban (brute-force protection)
- Enables automatic security updates

## Run It Anytime

Just re-run:
```bash
ansible-playbook -i inventory.ini hardening.yml
```

It's idempotent — safe to run multiple times.

## Future: Schedule It

Add to cron for weekly runs:
```bash
# Every Sunday at 4am
0 4 * * 0 ansible-playbook -i /path/to/inventory.ini /path/to/hardening.yml >> /var/log/ansible-hardening.log 2>&1
```
