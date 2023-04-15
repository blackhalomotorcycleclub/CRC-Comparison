# CRC-Comparison
Powershell scripts to generate and compare CRC values 

This repository contains a set of PowerShell scripts for generating and comparing CRC values of files.

Scripts
Get-CRC.ps1: This script scans directories recursively and generates the CRC value for each file. It takes one mandatory parameter: -Path which specifies the directory to scan. The script will automatically generate an output file name based on the current date and time and save the resulting CRC values to that file. The output file name will be in the format crc-yyyy-M-d.txt, where yyyy is the current year, M is the current month, and d is the current day.

Compare-CRC.ps1: This script compares the CRC values of files at a designated point in the filesystem. It takes three mandatory parameters: -Path which specifies the path of the text file containing the CRC values to compare, -ComparePath which specifies the path of the text file containing the CRC values to compare against, and -OutputFile which specifies the path of the text file to output the comparison results to. The script also takes two optional switches: -Verbose which displays detailed output and -Silent which only displays output in red text if any of the CRC values are mismatched.

Show-Help.ps1: This script displays documentation about the other scripts in this repository.

Main.ps1: This script provides a menu-based interface for calling the other scripts in this repository. When run, it will display a menu with options to call each of these scripts. You can enter 1 to call Get-CRC.ps1, 2 to call Compare-CRC.ps1, or 3 to call Show-Help.ps1. The script will then prompt you for any required parameters before calling the selected script.

Usage
To use these scripts, you will need to have PowerShell installed on your computer. You can run each script individually by calling it from the PowerShell command line or by right-clicking the script file and selecting “Run with PowerShell”. Alternatively, you can use Main.ps1 to call any of these scripts using a menu-based interface.

For example, to generate CRC values for all files in a directory using Get-CRC.ps1, you would run the following command from the PowerShell command line:

.\Get-CRC.ps1 -Path C:\Path\To\Directory
This would scan all files in C:\Path\To\Directory recursively and generate their CRC values. The resulting values would be saved to an automatically generated output file with a name based on the current date and time.

Contributing
Contributions are welcome! If you have any suggestions or improvements for these scripts, please feel free to open an issue or submit a pull request.
