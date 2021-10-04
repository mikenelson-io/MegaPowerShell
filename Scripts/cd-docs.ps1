﻿<#
.SYNOPSIS
	Change the working directory to the user's documents folder
.DESCRIPTION
	cd-docs.ps1 
.EXAMPLE
	PS> ./cd-docs
	📂/home/markus/Documents
.LINK
	https://github.com/fleschutz/PowerShell
.NOTES
	Author: Markus Fleschutz · License: CC0
#>

$TargetDir = resolve-path "$HOME/Documents"
if (-not(test-path "$TargetDir" -pathType container)) {
	write-warning "Sorry, the user's documents folder at 📂$TargetDir does not exist (yet)"
	exit 1
}
set-location "$TargetDir"
"📂$TargetDir"
exit 0 # success
