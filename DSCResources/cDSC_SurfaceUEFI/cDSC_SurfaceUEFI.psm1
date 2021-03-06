#Import-Module 'C:\Program Files\WindowsPowerShell\Modules\cDSC_SurfaceUEFI\DSCResources\cDSC_SurfaceUEFI\SurfaceUEFI.psm1' -Force
    
function Get-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateSet("Password","TPM","SecureBoot","PxeBoot","SideUsb","DockingPorts","FrontCamera","RearCamera","WiFi","Bluetooth","Audio","SdPort","AltBootOrder")]
		[System.String]
		$Name
	)

	#Write-Verbose "Use this cmdlet to deliver information about command processing."

	#Write-Debug "Use this cmdlet to write debug information while troubleshooting."

    $result = Get-SurfaceUEFISetting -Setting $name -UEFIPassword 'abcd'

	
	$returnValue = @{
		Name = [System.String]$result.Name
		Value = [System.String]$result.CurrentValue
		Ensure = [System.String]'Present'
	}

	$returnValue
	
}


function Set-TargetResource
{
	[CmdletBinding()]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateSet("Password","TPM","SecureBoot","PxeBoot","SideUsb","DockingPorts","FrontCamera","RearCamera","WiFi","Bluetooth","Audio","SdPort","AltBootOrder")]
		[System.String]
		$Name,

		[System.String]
		$Value,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	Write-Verbose "Use this cmdlet to deliver information about command processing."

	Write-Debug "Use this cmdlet to write debug information while troubleshooting."

    Set-SurfaceUEFISetting -Setting $name -Value $Value -UEFIPassword 'abcd'

	#Include this line if the resource requires a system reboot.
	#$global:DSCMachineStatus = 1


}


function Test-TargetResource
{
	[CmdletBinding()]
	[OutputType([System.Boolean])]
	param
	(
		[parameter(Mandatory = $true)]
		[ValidateSet("Password","TPM","SecureBoot","PxeBoot","SideUsb","DockingPorts","FrontCamera","RearCamera","WiFi","Bluetooth","Audio","SdPort","AltBootOrder")]
		[System.String]
		$Name,

		[System.String]
		$Value,

		[ValidateSet("Present","Absent")]
		[System.String]
		$Ensure
	)

	Write-Verbose "Use this cmdlet to deliver information about command processing."

	Write-Debug "Use this cmdlet to write debug information while troubleshooting."


	<#
	$result = [System.Boolean]
	
	$result
	#>
    Test-SurfaceUEFISetting -Setting $name -Value $Value -UEFIPassword 'ABCD' -verbose
}


Export-ModuleMember -Function *-TargetResource

