# Main script to call Get-CRC.ps1, Compare-CRC.ps1, and Show-Help.ps1

# Set the paths to the individual script files relative to the current directory
$GetCRCScript = Join-Path $PSScriptRoot "Get-CRC.ps1"
$CompareCRCScript = Join-Path $PSScriptRoot "Compare-CRC.ps1"
$ShowHelpScript = Join-Path $PSScriptRoot "Show-Help.ps1"

# Display menu and prompt for user input
Write-Host "Please select an option from the menu:"
Write-Host "1. Get-CRC: Scan directories recursively and generate CRC value for each file"
Write-Host "2. Compare-CRC: Compare CRC values of file to files at designated point in filesystem"
Write-Host "3. Show-Help: Display documentation about the script"
do {
    try {
        [int]$userInput = Read-Host "Enter your selection"
        if ($userInput -lt 1 -or $userInput -gt 3) { throw }
        break
    } catch {
        Write-Host "Invalid input. Please enter a number between 1 and 3."
    }
} while ($true)

# Call the selected script
switch ($userInput) {
    1 {
        # Prompt for parameters
        $Path = Read-Host "Enter the path of the directory to scan"
        $OutputFile = Read-Host "Enter the path of the output file"
        
        # Call Get-CRC.ps1
        & $GetCRCScript -Path $Path -OutputFile $OutputFile
    }
    2 {
        # Prompt for parameters
        $Path = Read-Host "Enter the path of the text file containing the CRC values to compare"
        $ComparePath = Read-Host "Enter the path of the text file containing the CRC values to compare against"
        $OutputFile = Read-Host "Enter the path of the output file"
        
        # Call Compare-CRC.ps1
        & $CompareCRCScript -Path $Path -ComparePath $ComparePath -OutputFile $OutputFile
    }
    3 {
        # Call Show-Help.ps1
        & $ShowHelpScript
    }
}