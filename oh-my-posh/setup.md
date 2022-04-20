[https://ohmyposh.dev/docs/pwsh]
[https://dejanstojanovic.net/powershell/2021/june/customizing-powershell-with-oh-my-posh-v3/]

### Install:

- Install-Module oh-my-posh -Scope CurrentUser

### Find/set themes:

- Get-PoshThemes
- Set-PoshPrompt -Theme <theme>

### Set default theme:

- Export-PoshTheme -FilePath ~/.mytheme.omp.json -Format json

### Set terminal icons:

- Install-Module -Name Terminal-Icons -Repository PSGallery