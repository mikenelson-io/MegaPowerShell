﻿<#
.SYNOPSIS
	Change the working directory to the user's recycle bin folder
.DESCRIPTION
	cd-recycle-bin.ps1 
.EXAMPLE
	PS> ./cd-recycle-bin
	📂C:\$Recycle.Bin\S-1-5-21-123404-23309-294260-1001
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz · License: CC0
#>

function Get-CurrentUserSID { [CmdletBinding()] param()
	Add-Type -AssemblyName System.DirectoryServices.AccountManagement
	return ([System.DirectoryServices.AccountManagement.UserPrincipal]::Current).SID.Value
}


$TargetDir = 'C:\$Recycle.Bin\' + "$(Get-CurrentUserSID)"
if (-not(test-path "$TargetDir" -pathType container)) {
	write-warning "Sorry, the user's recycle bin folder at 📂$TargetDir does not exist (yet)"
	exit 1
}
set-location "$TargetDir"
"📂$TargetDir"
exit 0 # success
