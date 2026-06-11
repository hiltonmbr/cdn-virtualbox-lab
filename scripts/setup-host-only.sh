#!/usr/bin/env bash
# -------------------------------------------------------------------
# setup-host-only.sh
# Creates a Host-Only network in VirtualBox and assigns an IP.
# Useful for stable SSH access to VMs without Wi-Fi dependency.
# -------------------------------------------------------------------

set -euo pipefail

NET_NAME="vboxnet0"
NET_CIDR="192.168.56.0/24"
NET_IP="192.168.56.1"

echo "🚀 Setting up Host-Only network on macOS..."

# Check if the network already exists
EXISTS=$(VBoxManage list hostonlyifs | grep -c "$NET_NAME" || true)

if [ "$EXISTS" -gt 0 ]; then
  echo "⚡ Network $NET_NAME already exists. Skipping creation."
else
  echo "🔧 Creating Host-Only network $NET_NAME..."
  VBoxManage hostonlyif create
  VBoxManage hostonlyif ipconfig "$NET_NAME" --ip "${NET_IP}" --netmask "255.255.255.0"
  echo "✅ Host-Only network created with IP $NET_IP ($NET_CIDR)"
fi

echo
echo "📋 Current Host-Only networks:"
VBoxManage list hostonlyifs
