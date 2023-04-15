# Function to compare CRC values of file to files at designated point in filesystem
param(
    [Parameter(Mandatory=$true)]
    [string]$Path,
    [Parameter(Mandatory=$true)]
    [string]$ComparePath,
    [Parameter(Mandatory=$true)]
    [string]$OutputFile,
    [switch]$Verbose,
    [switch]$Silent
)

if (!$OutputFile) {
    Write-Host "Please enter the path of the output file containing the CRC hash information:"
    do {
        try {
            $OutputFile = Read-Host "Enter the path"
            if (!$OutputFile) { throw }
            break
        } catch {
            Write-Host "Invalid input. Please enter a valid path."
        }
    } while ($true)
}

$pathHashes = Import-Csv -Path $Path
$compareHashes = Import-Csv -Path $ComparePath
$output = @()
foreach ($hash in $pathHashes) {
    if ($compareHashes.Hash -contains $hash.Hash) {
        if ($Verbose) {
            Write-Host "$($hash.Path): Match"
        }
        $output += New-Object PSObject -Property @{
            Path = $hash.Path
            Hash = $hash.Hash
            Match = $true
        }
    } else {
        if ($Silent) {
            Write-Host "$($hash.Path): Mismatch" -ForegroundColor Red
        } elseif ($Verbose) {
            Write-Host "$($hash.Path): Mismatch"
        }
        $output += New-Object PSObject -Property @{
            Path = $hash.Path
            Hash = $hash.Hash
            Match = $false
        }
    }
}
$output | Export-Csv -Path $OutputFile -NoTypeInformation