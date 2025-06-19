# Hybrid_Identity_Lab_Automation.ps1
----------------------------------------------------
# Hybrid Identity Lab: PowerShell Helper Script
# Author: Jean Berlin Tchampo
# Description: Create AD users, test AAD sync, and query sync status
# ----------------------------------------------------

# 1. Create multiple AD users
Import-Module ActiveDirectory

$users = @(
    @{FirstName="Alice"; LastName="Morgan"; OU="OU=IT,DC=corp,DC=local"},
    @{FirstName="Bob"; LastName="Thompson"; OU="OU=Sales,DC=corp,DC=local"},
    @{FirstName="Charlie"; LastName="Nguyen"; OU="OU=HR,DC=corp,DC=local"}
)

foreach ($u in $users) {
    $name = "$($u.FirstName) $($u.LastName)"
    $sam = "$($u.FirstName.Substring(0,1))$($u.LastName)"
    $password = ConvertTo-SecureString "P@ssword123" -AsPlainText -Force

    New-ADUser -Name $name -GivenName $u.FirstName -Surname $u.LastName `
        -SamAccountName $sam -UserPrincipalName "$sam@corp.local" `
        -AccountPassword $password -Enabled $true -Path $u.OU

    Write-Output "Created AD User: $name"
}

# 2. Force AAD Connect sync (must run on AAD Connect server)
Write-Output "Starting AAD Connect sync..."
Start-ADSyncSyncCycle -PolicyType Delta

# 3. Check last sync status
$connectInfo = Get-ADSyncConnectorRunStatus
Write-Output "Last Sync Result: $($connectInfo.RunStepResult)"
