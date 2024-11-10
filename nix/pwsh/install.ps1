
Write-Host '    ___               _____ __  __'
Write-Host '   /   |  ____  ____ / ___// / / /'
Write-Host '  / /| | / __ \/ __ \\__ \/ /_/ / '
Write-Host ' / ___ |/ / / / /_/ /__/ / __  /  '
Write-Host '/_/  |_/_/ /_/\____/____/_/ /_/   '
$ASH_SRC = "https://github.com/Anonoei/anosh"

try {
    $url = "https://raw.githubusercontent.com/ChrisTitusTech/powershell-profile/main/Microsoft.PowerShell_profile.ps1"
    $oldhash = Get-FileHash $PROFILE
    Invoke-RestMethod $url -OutFile "$env:temp/Microsoft.PowerShell_profile.ps1"
    $newhash = Get-FileHash "$env:temp/Microsoft.PowerShell_profile.ps1"
    if ($newhash.Hash -ne $oldhash.Hash) {
        Copy-Item -Path "$env:temp/Microsoft.PowerShell_profile.ps1" -Destination $PROFILE -Force
        Write-Host "Profile has been updated. Please restart your shell to reflect changes" -ForegroundColor Magenta
    }
}
catch {
    Write-Error "Unable to check for `$profile updates"
}

# Admin Check and Prompt Customization
$isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
function prompt {
    if ($isAdmin) { "[" + (Get-Location) + "] # " } else { "[" + (Get-Location) + "] $ " }
}
$adminSuffix = if ($isAdmin) { " [ADMIN]" } else { "" }
$Host.UI.RawUI.WindowTitle = "PowerShell {0}$adminSuffix" -f $PSVersionTable.PSVersion.ToString()
