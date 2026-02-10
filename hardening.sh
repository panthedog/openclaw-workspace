#!/bin/bash
# OpenClaw Healthcheck Hardening Script
# Run: bash hardening.sh
# Cron: 0 4 * * 0 bash /home/rtiodev/.openclaw/workspace/hardening.sh >> /home/rtiodev/.openclaw/workspace/logs/hardening.log 2>&1

LOGFILE="/home/rtiodev/.openclaw/workspace/logs/hardening.log"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

log() {
    echo "[$TIMESTAMP] $1" | tee -a "$LOGFILE"
}

log "=== Starting Hardening ==="

# 1. Install ufw
log "[1/4] Installing ufw..."
sudo apt update && sudo apt install -y ufw >> "$LOGFILE" 2>&1

# 2. Configure ufw
log "[2/4] Configuring firewall..."
sudo ufw default deny incoming >> "$LOGFILE" 2>&1
sudo ufw default allow outgoing >> "$LOGFILE" 2>&1
sudo ufw allow ssh >> "$LOGFILE" 2>&1
sudo ufw --force enable >> "$LOGFILE" 2>&1

# 3. Fix OpenClaw credentials perms
log "[3/4] Fixing OpenClaw credentials permissions..."
chmod 700 /home/rtiodev/.openclaw/credentials

# 4. Update OpenClaw
log "[4/4] Updating OpenClaw..."
openclaw update >> "$LOGFILE" 2>&1

log "=== Hardening Complete ==="
log "Log saved to: $LOGFILE"
