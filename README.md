# PowerShell Script for Virtual Switch and NAT Configuration

This PowerShell script automates the creation of a virtual switch, IP configuration, and NAT setup for Windows environments. It is designed for scenarios requiring an internal network with NAT for internet access or isolated networking setups.

## Features

- Creates a virtual switch of type `Internal`.
- Automatically configures the IP address for the associated adapter.
- Sets up a NAT for network address translation.
- Logs configuration details to the console for verification.

## Requirements

- **Operating System**: Windows with Hyper-V enabled.
- **PowerShell**: Run with administrative privileges.
- **Permissions**: Administrator rights are required to create switches and configure network settings.

## Usage

1. Clone or copy the script to your local machine.
2. Save it as `ConfigureSwitchAndNat.ps1`.
3. Open PowerShell with administrative privileges.
4. Run the script:
   ```powershell
   .\ConfigureSwitchAndNat.ps1

## The script will:

- Create a virtual switch named YourSwitchName.
- Configure the IP address YourIPAddress (Ex: 10.0.0.1) with a YourPrefixLength (ex: /24) prefix.
- Set up a NAT named YourNatName (Ex Internet) for the YourNetworkPrefix (Ex:10.0.0.0/24) network.

## Customization
You can customize the following variables in the script to suit your network setup:

## Switch Name:
$SwitchName = "YourSwitchName"
## NAT Name:
$NatName = "YourNatName"
## IP Address:
$IPAddress = "YourIPAddress"
## Prefix Length:
$PrefixLength = "YourPrefixLength"
## NAT Prefix:
$NatPrefix = "YourNetworkPrefix"

## Troubleshooting
- Ensure that Hyper-V is enabled on your Windows system.
- Run the script as an administrator to avoid permission errors.
- If the associated adapter is not found, verify the virtual switch name and re-run the script.

## License
- This script is licensed under the MIT License. Feel free to use, modify, and distribute it as needed.
