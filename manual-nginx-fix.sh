#!/bin/bash
echo "🔧 Manual Nginx Fix Script"
echo "========================="
echo "Run this script on your EC2 server to fix nginx configuration"
echo ""
echo "Copy and paste these commands on your server:"
echo ""

cat << 'EOF'
# 1. Create the correct nginx configuration
sudo tee /etc/nginx/sites-available/nextjs > /dev/null << 'NGINX_CONFIG'
server {
  listen 80;
  server_name _;

  # Security headers
  add_header X-Frame-Options "SAMEORIGIN" always;
  add_header X-Content-Type-Options "nosniff" always;
  add_header X-XSS-Protection "1; mode=block" always;

  # Gzip compression
  gzip on;
  gzip_vary on;
  gzip_min_length 1000;
  gzip_types
    text/plain
    text/css
    text/js
    text/xml
    text/javascript
    application/javascript
    application/xml+rss
    application/json;

  location / {
    proxy_pass http://127.0.0.1:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_cache_bypass $http_upgrade;
    proxy_read_timeout 86400s;
    proxy_send_timeout 86400s;
    proxy_connect_timeout 60s;
  }

  # Static files caching
  location /_next/static/ {
    proxy_pass http://127.0.0.1:3000;
    expires 1y;
    add_header Cache-Control "public, immutable";
  }

  # Health check
  location /health {
    access_log off;
    return 200 "healthy\n";
    add_header Content-Type text/plain;
  }
}
NGINX_CONFIG

# 2. Enable the site and disable default
sudo ln -sf /etc/nginx/sites-available/nextjs /etc/nginx/sites-enabled/
sudo rm -f /etc/nginx/sites-enabled/default

# 3. Test and restart nginx
sudo nginx -t
sudo systemctl restart nginx

# 4. Check status
echo "✅ Nginx configuration updated!"
echo "🔍 Testing configuration..."
curl -I http://localhost/ | head -5
echo ""
echo "🎯 Your app should now be available at: http://52.12.223.195/"
EOF

echo ""
echo "📋 Alternative: If sites-available doesn't exist, use this instead:"
echo ""

cat << 'EOF2'
# For systems without sites-available (like Amazon Linux)
sudo tee /etc/nginx/conf.d/nextjs.conf > /dev/null << 'NGINX_CONFIG2'
server {
  listen 80;
  server_name _;

  location / {
    proxy_pass http://127.0.0.1:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
    proxy_cache_bypass $http_upgrade;
  }
}
NGINX_CONFIG2

# Remove default config and restart
sudo rm -f /etc/nginx/conf.d/default.conf
sudo nginx -t && sudo systemctl restart nginx
EOF2
