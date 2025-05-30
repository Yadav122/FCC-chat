@echo off
echo ========================================
echo    Agent Chat UI - Local Setup
echo ========================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed!
    echo.
    echo Please install Node.js from: https://nodejs.org/
    echo Recommended version: 18.x or higher
    echo.
    pause
    exit /b 1
)

echo ✅ Node.js is installed: 
node --version

REM Check if pnpm is installed
pnpm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo 📦 Installing pnpm package manager...
    npm install -g pnpm
    if %errorlevel% neq 0 (
        echo ❌ Failed to install pnpm
        pause
        exit /b 1
    )
)

echo ✅ pnpm is installed: 
pnpm --version

echo.
echo 📦 Installing project dependencies...
pnpm install

if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    pause
    exit /b 1
)

echo.
echo ✅ Setup completed successfully!
echo.
echo 🚀 To start the development server, run:
echo    pnpm dev
echo.
echo 🌐 The app will be available at: http://localhost:3000
echo.
echo 📝 Optional: Create a .env file for configuration
echo    Copy .env.example to .env if it exists
echo.
pause
