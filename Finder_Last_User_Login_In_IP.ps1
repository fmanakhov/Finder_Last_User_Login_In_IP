Write-Host "Enter username:"
$Name = Read-Host

$result = Get-EventLog -LogName Security -InstanceId 4624 -Newest 16 -Message *$Name* |
   ForEach-Object {
     [PSCustomObject]@{
     Time = $_.TimeGenerated
     IP = $_.ReplacementStrings[18]
     }
   }


Write-Host "Last login of Username:" $Name 
$result | Select-Object Time, IP