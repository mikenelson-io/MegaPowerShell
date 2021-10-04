﻿<#
.SYNOPSIS
	Change the working directory to the user's Dropbox folder
.DESCRIPTION
	cd-dropbox.ps1 
.EXAMPLE
	PS> ./cd-dropbox
	📂/home/markus/Dropbox
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz · License: CC0
#>

$TargetDir = resolve-path "$HOME/Dropbox"
if (-not(test-path "$TargetDir" -pathType container)) {
	write-warning "Sorry, the user's Dropbox folder at 📂$TargetDir does not exist (yet)"
	exit 1
}
set-location "$TargetDir"
"📂$TargetDir"
exit 0 # success
