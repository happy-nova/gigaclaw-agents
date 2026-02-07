FROM node:22-slim

# Install OpenClaw globally
RUN npm install -g openclaw

# Create app directory
WORKDIR /app

# Copy configuration and workspaces
COPY openclaw.json ./
COPY workspaces ./workspaces

# Expose gateway port
EXPOSE 18789

# Start OpenClaw gateway
CMD ["openclaw", "gateway", "start", "--foreground"]
