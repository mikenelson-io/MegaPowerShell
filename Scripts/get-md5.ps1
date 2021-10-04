﻿<#
.SYNOPSIS
	Prints the MD5 checksum of the given file
.DESCRIPTION
	get-md5.ps1 [<file>]
.EXAMPLE
	PS> ./get-md5 C:\MyFile.txt
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$file = "")

try {
	if ($file -eq "" ) { $file = read-host "Enter path to file" }

	$Result = get-filehash $file -algorithm MD5

	"✔️ MD5 hash is" $Result.Hash
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
