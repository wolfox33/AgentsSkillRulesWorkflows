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
  @{ base = Join-Path $root '.agent';    map = @{ skills = 'skills'; agents = 'agents'; rules = 'rules'; workflows = 'workflows' } }
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

$workflowFiles = Get-ChildItem -Path $canonical.workflows -Filter '*.md' -File -ErrorAction SilentlyContinue
if (-not $workflowFiles) {
  Write-Warning "No workflow .md files found in '$($canonical.workflows)'. .windsurf/workflows will be empty until you add workflows to the canonical folder."
}

foreach ($mirror in $mirrors) {
  Ensure-Dir $mirror.base
  foreach ($k in $mirror.map.Keys) {
    $target = $canonical[$k]
    $path   = Join-Path $mirror.base $mirror.map[$k]
    Ensure-Junction $path $target
  }
}

# Windsurf: criar espelho flatten para skills e rules (compatibilidade com scanner)
$windsurfRoot = Join-Path $root '.windsurf'
Ensure-Dir $windsurfRoot

function Ensure-Dir-Clean([string]$path) {
  if (Test-Path $path) { Remove-Item -Recurse -Force $path }
  New-Item -ItemType Directory -Path $path | Out-Null
}

# Flatten skills: .windsurf/skills/<skill>/ (sem camada de categoria)
$windsurfSkills = Join-Path $windsurfRoot 'skills'
Ensure-Dir-Clean $windsurfSkills

$skillDirs = Get-ChildItem -Path $canonical.skills -Directory -Recurse -ErrorAction SilentlyContinue | Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') }
$seenSkillNames = @{}
foreach ($dir in $skillDirs) {
  $name = $dir.Name
  if ($seenSkillNames.ContainsKey($name)) {
    $name = "$($dir.Parent.Name)-$name" # evita colisao
  }
  $seenSkillNames[$name] = $true
  $dest = Join-Path $windsurfSkills $name
  Ensure-Junction $dest $dir.FullName
}

# Flatten rules: criar links de arquivo direto em .windsurf/rules
$windsurfRules = Join-Path $windsurfRoot 'rules'
Ensure-Dir-Clean $windsurfRules

$ruleFiles = @()
$ruleFiles += Get-ChildItem -Path (Join-Path $canonical.rules 'global') -Filter '*.md' -File -ErrorAction SilentlyContinue
$ruleFiles += Get-ChildItem -Path (Join-Path $canonical.rules 'agents') -Filter '*.md' -File -ErrorAction SilentlyContinue

foreach ($file in $ruleFiles) {
  $prefix = $file.Directory.Name
  $name = "$prefix-$($file.BaseName)$($file.Extension)"
  $dest = Join-Path $windsurfRules $name
  if (Test-Path $dest) { Remove-Item -Force $dest }
  New-Item -ItemType HardLink -Path $dest -Target $file.FullName | Out-Null
}

# Flatten workflows (copiar .md em nivel direto)
$windsurfWorkflows = Join-Path $windsurfRoot 'workflows'
Ensure-Dir-Clean $windsurfWorkflows
$workflowFiles = Get-ChildItem -Path $canonical.workflows -Filter '*.md' -File -ErrorAction SilentlyContinue
foreach ($file in $workflowFiles) {
  $dest = Join-Path $windsurfWorkflows $file.Name
  New-Item -ItemType HardLink -Path $dest -Target $file.FullName | Out-Null
}

Write-Host "Junctions refreshed for .agent and flattened mirrors for .windsurf" -ForegroundColor Green
