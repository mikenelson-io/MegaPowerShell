﻿<#
.SYNOPSIS
	Lists the installed apps
.DESCRIPTION
	Lists the installed apps (from Windows Store or snaps).
	list-installed-apps.ps1
.EXAMPLE
	PS> ./list-installed-apps
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

try {
	if ($IsLinux) {
		& snap list
	} else {
		get-appxPackage | select-object Name,Version | format-table -autoSize
	}
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
