param($Timer)

# You need to add the following lines to requirements.psd1
# @{
#    'Microsoft.Online.SharePoint.PowerShell' = '16.*'
#}

$currentUTCtime = (Get-Date).ToUniversalTime()

if ($Timer.IsPastDue) {
    Write-Host "PowerShell timer is running late!"
}

Write-Host "PowerShell timer trigger function ran! TIME: $currentUTCtime"

Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking -UseWindowsPowerShell
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $env:USER, $(ConvertTo-SecureString $env:PASS -AsPlainText -Force)
Connect-SPOService -Url $env:URL -Credential $cred
Get-SPOSite