<#
.SYNOPSIS
    Removes an Organizational Unit that was created by mistake.

.DESCRIPTION
    AD protects OUs from accidental deletion by default. This script removes
    that protection, then deletes the OU and everything inside it.

.NOTES
    Author:   Jorge Antonio Nava
    WARNING:  -Recursive deletes ALL objects inside the OU (users, groups, computers).
              Double-check the OU name and run with -WhatIf first.
              Replace NameOfOU and the DC= values with your own domain.
#>

# Step 1: Remove "Protect from accidental deletion"
Set-ADOrganizationalUnit `
    -Identity "OU=NameOfOU,DC=Fabrikam,DC=com" `
    -ProtectedFromAccidentalDeletion $false

# Step 2 (preview): Show what WOULD be deleted without deleting anything
Remove-ADOrganizationalUnit `
    -Identity "OU=NameOfOU,DC=Fabrikam,DC=com" `
    -Recursive `
    -WhatIf

# Step 3 (delete): Uncomment only after the preview looks correct
# Remove-ADOrganizationalUnit `
#     -Identity "OU=NameOfOU,DC=Fabrikam,DC=com" `
#     -Recursive `
#     -Confirm:$false
