PowerShell Script Sample Provided
Import-Module ActiveDirectory
# Get domain information automatically
$domain = Get-ADDomain
$baseDN = $domain.DistinguishedName
$dnsRoot = $domain.DNSRoot

# Define existing OU and Group
$ouPath = "OU=Sales,$baseDN"
$groupName = "Sales_Group"

# Default password
$password = ConvertTo-SecureString "Password101!" -AsPlainText -Force

# Import CSV
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

        Write-Host "Created and added to Sales_Group: $username" -ForegroundColor Green
    }
    else {
        Write-Host "User already exists: $username" -ForegroundColor Yellow
    }
}
Commands for Deleting Accidentally-Created OUs:
Removes Protected OU from being deleted:
Set-ADOrganizationalUnit `
-Identity "OU=NameOfOU,DC=Fabrikam,DC=com" `
-ProtectedFromAccidentalDeletion $false


Completely Removes Specific OU:
Remove-ADOrganizationalUnit `
-Identity "OU=NameOfOU,DC=Fabrikam,DC=com" `
-Recursive `
-Confirm:$false

