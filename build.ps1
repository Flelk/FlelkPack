<#
  Packs the built zips of all the mods into one r2modman zip in .\dist\.
  Build a mod with its own build.ps1 first if it has changed.

  .\build.ps1                      package
  .\build.ps1 -Install             also copy it into the r2modman profile (close the game first)
  .\build.ps1 -Install -R2Profile "Name"
#>
param(
    [switch]$Install,
    [string]$R2Profile = 'repo'
)
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression.FileSystem

$root = $PSScriptRoot
$mods = 'EnemyHP', 'MoreUpgrades', 'LootScanner', 'RepoCoins', 'Skinwalker'
$manifest = Get-Content "$root\thunderstore\manifest.json" -Raw | ConvertFrom-Json
$name = $manifest.name
$ver  = $manifest.version_number

$stage = "$root\dist\stage"
Remove-Item $stage -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory $stage -Force | Out-Null
Copy-Item "$root\thunderstore\*" $stage

foreach ($mod in $mods) {
    $modDir = Join-Path (Split-Path $root) $mod
    $modVer = (Get-Content "$modDir\thunderstore\manifest.json" -Raw | ConvertFrom-Json).version_number
    $modZip = "$modDir\dist\$mod-$modVer.zip"
    if (-not (Test-Path $modZip)) { throw "Missing $modZip. Run $mod's build.ps1 first." }

    $archive = [IO.Compression.ZipFile]::OpenRead($modZip)
    try {
        $entry = $archive.Entries | Where-Object { $_.Name -eq "$mod.dll" } | Select-Object -First 1
        if (-not $entry) { throw "$modZip has no $mod.dll." }
        [IO.Compression.ZipFileExtensions]::ExtractToFile($entry, "$stage\$mod.dll")
    } finally { $archive.Dispose() }
    Write-Host "$mod $modVer"
}

$zip = "$root\dist\$name-$ver.zip"
Remove-Item $zip -Force -ErrorAction SilentlyContinue
Compress-Archive -Path "$stage\*" -DestinationPath $zip
Write-Host "Package: $zip" -ForegroundColor Green

if ($Install) {
    $profileDir = "$env:APPDATA\r2modmanPlus-local\REPO\profiles\$R2Profile"
    if (-not (Test-Path "$profileDir\BepInEx\core")) { throw "No BepInEx in r2modman profile '$R2Profile'." }
    $target = "$profileDir\BepInEx\plugins\flelk-$name"
    New-Item -ItemType Directory $target -Force | Out-Null
    Copy-Item "$stage\*" $target -Force
    Write-Host "Installed to $target" -ForegroundColor Green
}
Remove-Item $stage -Recurse -Force
