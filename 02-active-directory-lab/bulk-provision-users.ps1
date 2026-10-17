<#
.SYNOPSIS
    Bulk-creates Active Directory users from a CSV file and adds them to a security group.

.DESCRIPTION
    Reads FirstName and LastName from a CSV, builds a username (firstname.lastname),
    creates the account in the Sales OU, forces a password change at first logon,
    and adds the user to Sales_Group. Existing users are skipped.

.NOTES
    Author:       Jorge Antonio Nava
    Environment:  Windows Server 2022 domain controller (home lab)
    Requires:     ActiveDirectory PowerShell module, existing OU=Sales and Sales_Group
    WARNING:      The default password below is for lab use only.
                  Never hardcode passwords in a production environment.

.EXAMPLE
    .\bulk-provision-users.ps1
#>

Import-Module ActiveDirectory

# Get domain information automatically
$domain  = Get-ADDomain
$baseDN  = $domain.DistinguishedName
$dnsRoot = $domain.DNSRoot

# Define existing OU and group
$ouPath    = "OU=Sales,$baseDN"
$groupName = "Sales_Group"

# Default password (lab only - users must change it at first logon)
$password = ConvertTo-SecureString "Password101!" -AsPlainText -Force

# Import CSV (columns: FirstName, LastName)
$users = Import-Csv "C:\BulkUsers\bulk.csv"

foreach ($user in $users) {

    $username = ($user.FirstName + "." + $user.LastName).ToLower()

    # Check if user already exists
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$username'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name "$($user.FirstName) $($user.LastName)" `
            -GivenName $user.FirstName `
            -Surname $user.LastName `
            -SamAccountName $username `
            -UserPrincipalName "$username@$dnsRoot" `
            -Department "Sales" `
            -AccountPassword $password `
            -Enabled $true `
            -ChangePasswordAtLogon $true `
            -Path $ouPath

        Add-ADGroupMember -Identity $groupName -Members $username

        Write-Host "Created and added to ${groupName}: $username" -ForegroundColor Green
    }
    else {
        Write-Host "User already exists: $username" -ForegroundColor Yellow
    }
}
