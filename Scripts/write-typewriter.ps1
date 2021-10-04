﻿<#
.SYNOPSIS
	Writes text with the typewriter effect
.DESCRIPTION
	write-typewriter.ps1 [<text>] [<speed>]
.EXAMPLE
	PS> ./write-typewriter "Hello World"
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

param([string]$text = "`nHello World`n-----------`nPowerShell is cross-platform`nPowerShell is open-source`nPowerShell is easy to learn`nPowerShell is fully documented`n`nThanks for watching`n`n:-)`n`n", [int]$speed = 250) # in milliseconds

try {
	$Random = New-Object System.Random

	$text -split '' | ForEach-Object {
		write-host -nonewline $_
		start-sleep -milliseconds $(1 + $Random.Next($speed))
	}
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
