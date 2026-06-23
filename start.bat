@echo off
cd /d "%~dp0"

if not exist node_modules (
  echo Installing dependencies...
  call npm install
)

if not exist node_modules\electron\path.txt (
  echo Repairing Electron installation...
  call npm run fix-electron
)

if not exist node_modules\electron\dist\electron.exe (
  echo Electron binary not found.
  call npm run fix-electron
)

rem Background launch (no console window)
if exist "%~dp0start.vbs" (
  wscript.exe //nologo "%~dp0start.vbs"
) else (
  powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "%~dp0start-hidden.ps1"
)
exit /b 0
