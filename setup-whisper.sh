#!/bin/bash
# Install Whisper + Configure Passwordless Sudo
# Run as: bash setup-whisper.sh

set -e

echo "=== Installing Whisper & Configuring Sudo ==="

# Get current user
USER=$(whoami)
echo "User: $USER"

# 1. Update sudoers file
echo "[1/3] Configuring passwordless sudo for apt..."
SUDOERS_FILE="/etc/sudoers.d/hardening"

# Create the file with correct username
cat > /tmp/hardening <<EOF
# OpenClaw Hardening - Passwordless Sudo
# Allows passwordless sudo for apt and apt-get
rtiodev ALL=(ALL) NOPASSWD: /usr/bin/apt
rtiodev ALL=(ALL) NOPASSWD: /usr/bin/apt-get
EOF

# Replace username placeholder
sed -i "s/rtiodev/$USER/g" /tmp/hardening

# Install sudoers file (visudo validates it)
sudo visudo -c -f /tmp/hardening
sudo cp /tmp/hardening "$SUDOERS_FILE"
sudo chmod 440 "$SUDOERS_FILE"
echo "✓ Sudoers configured"

# 2. Install dependencies
echo "[2/3] Installing ffmpeg and pip..."
sudo -n apt-get update -qq
sudo -n apt-get install -y ffmpeg python3-pip

# 3. Install Whisper
echo "[3/3] Installing openai-whisper..."
pip3 install --user --break-system-packages openai-whisper

# Verify installation
if command -v whisper &> /dev/null; then
    echo "=== Whisper Installed Successfully ==="
    whisper --version
else
    echo "=== Installation Complete ==="
    echo "Run: source ~/.bashrc && whisper --version"
fi

echo ""
echo "Usage: whisper --model small audio.ogg"
