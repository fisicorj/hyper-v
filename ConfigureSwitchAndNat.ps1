##########################################
## Autor: Manoel Moraes
## Version: 1.0
##########################################

# Set the name of the virtual switch
$SwitchName = "YourSwitchName" 
# Set the name of the NAT
$NatName = "YourNatName"

# Set the IP address and prefix length
$IPAddress = "YourIPAddress"
$PrefixLength = "YourPrefixLength"

# Set the network prefix for the NAT
$NatPrefix = "YourNetworkPrefix"

# Create the virtual switch with the specified name
New-VMSwitch -SwitchName $SwitchName -SwitchType Internal

# Automatically get the network adapter associated with the newly created internal switch
$Adapter = Get-NetAdapter | Where-Object {$_.Name -eq "vEthernet ($SwitchName)"}

if ($Adapter -ne $null) {
    # Capture the InterfaceIndex of the associated adapter
    $InterfaceIndex = $Adapter.ifIndex

    # Configure the IP address for the associated adapter
    New-NetIPAddress -IPAddress $IPAddress -PrefixLength $PrefixLength -InterfaceIndex $InterfaceIndex

    # Create a NAT with the specified name and network prefix
    New-NetNat -Name $NatName -InternalIPInterfaceAddressPrefix $NatPrefix

    Write-Host "Configuration completed successfully!" -ForegroundColor Green
    Write-Host "Details:"
    Write-Host "Virtual Switch: $SwitchName"
    Write-Host "NAT: $NatName"
    Write-Host "IP Address: $IPAddress/$PrefixLength"
    Write-Host "NAT Prefix: $NatPrefix"
} else {
    Write-Host "Error: Network adapter associated with the switch '$SwitchName' was not found." -ForegroundColor Red
}