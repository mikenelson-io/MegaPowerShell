﻿<#
.SYNOPSIS
	Downloads a folder (including subfolders) from the given URL
.DESCRIPTION
	download-dir.ps1 [<URL>]
.EXAMPLE
	PS> ./download-dir "https://www.cnn.com"
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$URL = "")

try {
	if ($URL -eq "") { $URL = read-host "Enter directory URL to download" }

	$StopWatch = [system.diagnostics.stopwatch]::startNew()

	& wget --version
	if ($lastExitCode -ne "0") { throw "Can't execute 'wget' - make sure wget is installed and available" }

	& wget --mirror --convert-links --adjust-extension --page-requisites --no-parent $URL --directory-prefix . --no-verbose
	if ($lastExitCode -ne "0") { throw "Can't execute 'wget --mirror $URL'" }

	[int]$Elapsed = $StopWatch.Elapsed.TotalSeconds
	"✔️ downloaded directory from $URL in $Elapsed sec"
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
