Import-Module oh-my-posh
Set-PoshPrompt -Theme ~/.mytheme.omp.json

Import-Module -Name Terminal-Icons
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Import-Module PSUtil