FROM node:22-slim

# Install OpenClaw globally
RUN npm install -g openclaw

# Create app directory
WORKDIR /app

# Copy configuration
COPY openclaw.json ./

# Copy default workspaces to a template directory
# (will be used to seed empty volumes)
COPY workspaces ./workspaces-template

# Create entrypoint script
COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

# Expose gateway port
EXPOSE 18789

# Use entrypoint to handle volume seeding
ENTRYPOINT ["./entrypoint.sh"]
