﻿<#
.SYNOPSIS
	Performs a selftest on your S.M.A.R.T. HDD/SSD devices.
.DESCRIPTION
	check-smart-devices.ps1 [<type>]
	Type is either short(default) or long.
        Requires smartctl (smartmontools package) and admin rights.
.EXAMPLE
	PS> ./check-smart-devices
	✔️ short selftest started on S.M.A.R.T. device /dev/sda
.NOTES
	Author: Markus Fleschutz · License: CC0
.LINK
	https://github.com/fleschutz/PowerShell
#>

#Requires -RunAsAdministrator

param([string]$type = "short")

try {
	$Result=(smartctl --version)
	if ($lastExitCode -ne "0") { throw "Can't execute 'smartctl' - make sure smartmontools are installed" }

	$Devices = $(sudo smartctl --scan-open)
	foreach($Device in $Devices) {
		$Array = $Device.split(" ")
		$Device = $Array[0]
		$Result = (sudo smartctl --test=$type $Device)
		"✔️ $type selftest started on S.M.A.R.T. device $Device"
	}
	exit 0 # success
} catch {
	"⚠️ Error: $($Error[0]) ($($MyInvocation.MyCommand.Name):$($_.InvocationInfo.ScriptLineNumber))"
	exit 1
}
