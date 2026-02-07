#!/bin/sh
set -e

# Seed workspaces volume if empty (first deploy)
if [ -d "/app/workspaces" ] && [ -z "$(ls -A /app/workspaces 2>/dev/null)" ]; then
  echo "Seeding workspaces volume with defaults..."
  cp -r /app/workspaces-template/* /app/workspaces/
fi

# Ensure workspaces directory exists
mkdir -p /app/workspaces

# Start OpenClaw gateway
exec openclaw gateway start --foreground
