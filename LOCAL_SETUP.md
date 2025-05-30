# Local Setup Guide

## Quick Start (Automated Setup)

### Option 1: Using Batch Script (Windows)
```bash
setup.bat
```

### Option 2: Using PowerShell Script (Windows)
```powershell
.\setup.ps1
```

### Option 3: Using Package.json Scripts
```bash
# Install dependencies and show completion message
pnpm setup

# Install dependencies and start development server
pnpm setup-and-run
```

## Manual Setup

### Prerequisites
- **Node.js** (version 18.x or higher)
- **pnpm** package manager

### Step 1: Install Node.js
Download and install from: https://nodejs.org/
Recommended version: 18.x or higher

### Step 2: Install pnpm
```bash
npm install -g pnpm
```

### Step 3: Install Dependencies
```bash
pnpm install
```

### Step 4: Start Development Server
```bash
pnpm dev
```

### Step 5: Open in Browser
Navigate to: http://localhost:3000

## Available Scripts

- `pnpm dev` - Start development server
- `pnpm build` - Build for production
- `pnpm start` - Start production server
- `pnpm setup` - Install dependencies with completion message
- `pnpm setup-and-run` - Install dependencies and start dev server

## Environment Configuration (Optional)

Create a `.env` file in the root directory for custom configuration:

```env
NEXT_PUBLIC_API_URL=http://localhost:2024
NEXT_PUBLIC_ASSISTANT_ID=agent
```

## Troubleshooting

### Common Issues:

1. **Node.js not found**
   - Install Node.js from https://nodejs.org/
   - Restart your terminal/command prompt

2. **pnpm not found**
   - Run: `npm install -g pnpm`
   - Restart your terminal/command prompt

3. **Permission errors**
   - Run terminal/command prompt as Administrator
   - Or use: `npm config set prefix ~/.npm-global`

4. **Port 3000 already in use**
   - Kill the process using port 3000
   - Or use a different port: `pnpm dev -- -p 3001`

## Project Structure

This is a Next.js application with:
- React 19
- TypeScript
- Tailwind CSS
- LangGraph integration
- Various UI components

## Need Help?

Check the main README.md for detailed documentation about the application features and usage.
