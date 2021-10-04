﻿<#
.SYNOPSIS
	Lists the current working directory
.DESCRIPTION
	list-workdir.ps1 
.EXAMPLE
	PS> ./list-workdir
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	$CWD = resolve-path "$PWD"
	"📂$CWD"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
