#!/bin/bash
echo "🔍 Server Debugging Script"
echo "=========================="

# Check if we can connect to the server
echo "1. Testing server connectivity..."
if ping -c 1 52.12.223.195 >/dev/null 2>&1; then
    echo "✅ Server is reachable"
else
    echo "❌ Server is not reachable"
fi

echo ""
echo "2. Testing HTTP response..."
curl -I http://52.12.223.195/ 2>/dev/null | head -5

echo ""
echo "3. Testing if port 3000 is accessible..."
curl -I http://52.12.223.195:3000/ 2>/dev/null | head -5 || echo "❌ Port 3000 not accessible"

echo ""
echo "4. Checking nginx configuration..."
curl -s http://52.12.223.195/ | grep -i "nginx\|welcome" | head -3

echo ""
echo "🔧 To fix this issue, you need to SSH into your server and run:"
echo "ssh -i your-key.pem ec2-user@52.12.223.195"
echo ""
echo "Then run these commands on the server:"
echo "1. pm2 status"
echo "2. pm2 logs nextjs-app"
echo "3. sudo systemctl status nginx"
echo "4. netstat -tlnp | grep :3000"
