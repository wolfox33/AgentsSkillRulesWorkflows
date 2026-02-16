# Creates/refreshes junction mirrors for Antigravity (.agent) and Windsurf (.windsurf)
# Run from any location: powershell -ExecutionPolicy Bypass -File tools/setup-links.ps1

# Script lives in /tools; repo root is parent
$root = Split-Path -Parent $PSScriptRoot

$canonical = @{
  skills    = Join-Path $root 'skills'
  agents    = Join-Path $root 'Agents'
  rules     = Join-Path $root 'Rules'
  workflows = Join-Path $root 'workflows'
}

$mirrors = @(
  @{ base = Join-Path $root '.agent';    map = @{ skills = 'skills'; agents = 'agents'; rules = 'rules'; workflows = 'workflows' } },
  @{ base = Join-Path $root '.windsurf'; map = @{ skills = 'skills'; agents = 'agents'; rules = 'rules'; workflows = 'workflows' } }
)

function Assert-Canonical([string]$path) {
  if (-not (Test-Path $path)) { throw "Canonical path not found: $path" }
}

function Ensure-Dir([string]$path) {
  if (-not (Test-Path $path)) { New-Item -ItemType Directory -Path $path | Out-Null }
}

function Ensure-Junction([string]$path, [string]$target) {
  if (Test-Path $path) {
    $item = Get-Item $path -Force
    if ($item.LinkType -eq 'Junction' -and $item.Target -eq $target) { return }
    Remove-Item -Recurse -Force $path
  }
  New-Item -ItemType Junction -Path $path -Target $target | Out-Null
}

foreach ($target in $canonical.Values) { Assert-Canonical $target }

foreach ($mirror in $mirrors) {
  Ensure-Dir $mirror.base
  foreach ($k in $mirror.map.Keys) {
    $target = $canonical[$k]
    $path   = Join-Path $mirror.base $mirror.map[$k]
    Ensure-Junction $path $target
  }
}

Write-Host "Junctions refreshed for .agent and .windsurf" -ForegroundColor Green
