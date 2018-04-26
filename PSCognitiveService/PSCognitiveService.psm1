using assembly System.Drawing
using namespace Vision
using namespace Face
[cmdletbinding()]
param()

$BasePath = $PSScriptRoot

# define class sequence
$classList = @(
    'Enum',
    'ValidateFile',
    'ValidateImage',
    'ValidateMarket',
    'Vision',
    'Face',
    'Moderate',
    'Analytics'
)

# importing classes sequentially
foreach ($class in $classList) {
    Write-Verbose "Dot sourcing class '$class'"
    . "$BasePath\classes\$class.ps1"
}


# dot dourcing files
$FolderNames = @(
    'Private',
    'Public'
)

Get-ChildItem $($FolderNames.ForEach({"$BasePath\$_\"})) -Recurse -Filter *.ps1 | ForEach-Object {. $_.FullName}
