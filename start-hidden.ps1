$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

$electron = Join-Path $root "node_modules\electron\dist\electron.exe"
if (-not (Test-Path $electron)) {
  [System.Windows.Forms.MessageBox]::Show(
    "Electron not found.`nPlease run start.bat first.",
    "Clipboard Manager",
    [System.Windows.Forms.MessageBoxButtons]::OK,
    [System.Windows.Forms.MessageBoxIcon]::Error
  ) | Out-Null
  exit 1
}

Start-Process -FilePath $electron -ArgumentList "." -WorkingDirectory $root -WindowStyle Hidden
