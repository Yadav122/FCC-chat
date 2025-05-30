Write-Host "========================================" -ForegroundColor Cyan
Write-Host "    Agent Chat UI - Local Setup" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Node.js is installed
try {
    $nodeVersion = node --version
    Write-Host "✅ Node.js is installed: $nodeVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Node.js is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Node.js from: https://nodejs.org/" -ForegroundColor Yellow
    Write-Host "Recommended version: 18.x or higher" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

# Check if pnpm is installed
try {
    $pnpmVersion = pnpm --version
    Write-Host "✅ pnpm is installed: $pnpmVersion" -ForegroundColor Green
} catch {
    Write-Host ""
    Write-Host "📦 Installing pnpm package manager..." -ForegroundColor Yellow
    try {
        npm install -g pnpm
        $pnpmVersion = pnpm --version
        Write-Host "✅ pnpm installed successfully: $pnpmVersion" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to install pnpm" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host ""
Write-Host "📦 Installing project dependencies..." -ForegroundColor Yellow

try {
    pnpm install
    Write-Host ""
    Write-Host "✅ Setup completed successfully!" -ForegroundColor Green
    Write-Host ""
    Write-Host "🚀 To start the development server, run:" -ForegroundColor Cyan
    Write-Host "   pnpm dev" -ForegroundColor White
    Write-Host ""
    Write-Host "🌐 The app will be available at: http://localhost:3000" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📝 Optional: Create a .env file for configuration" -ForegroundColor Yellow
    Write-Host "   Copy .env.example to .env if it exists" -ForegroundColor Yellow
    Write-Host ""
} catch {
    Write-Host "❌ Failed to install dependencies" -ForegroundColor Red
    Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}

Read-Host "Press Enter to exit"
