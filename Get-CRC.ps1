# Function to scan directories recursively and generate CRC value for each file
param(
    [Parameter(Mandatory=$true)]
    [string]$Path,
    [Parameter(Mandatory=$true)]
    [string]$OutputFile
)

$files = Get-ChildItem $Path -Recurse | Where-Object {!$_.PSIsContainer}
$output = @()
foreach ($file in $files) {
    $hash = Get-FileHash -Path $file.FullName -Algorithm SHA256
    $output += New-Object PSObject -Property @{
        Path = $file.FullName
        Hash = $hash.Hash
    }
}
$output | Export-Csv -Path $OutputFile -NoTypeInformation