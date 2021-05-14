param($Timer)

$currentUTCtime = (Get-Date).ToUniversalTime()

if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"

$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:USER, $(ConvertTo-SecureString $env:PASSWORD -AsPlainText -Force)
Connect-MicrosoftTeams -Credential $cred
Get-Team | %{ Write-Host $_.DisplayName }
