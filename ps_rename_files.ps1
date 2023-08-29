# Define the source folder
$sourceFolder = "C:\path\to\your\folder"

# Define the pattern to search for in filenames
$pattern = "_TSi0.2_"

# Define the replacement pattern
$replacement = "_TSi0.5_"

# Print the source folder
Write-Host "The source folder: $sourceFolder"

# Get all files in the source folder and its subfolders
$files = Get-ChildItem -Path $sourceFolder -Recurse | Where-Object { !$_.PSIsContainer }

# Count the files matching the pattern
$filesMatchingPattern = $files | Where-Object { $_.Name -like "*$pattern*" }
$matchingCountBefore = $filesMatchingPattern.Count
Write-Host "Number of files matching '$pattern' before renaming: $matchingCountBefore"

# Loop through each file and rename if necessary
$renamedCount = 0
foreach ($file in $files) {
    if ($file.Name -like "*$pattern*") {
        $newName = $file.Name -replace [regex]::Escape($pattern), $replacement
        Rename-Item -Path $file.FullName -NewName $newName
        $renamedCount++
    }
}

# Count the files matching the pattern after renaming
$filesMatchingPattern = $files | Where-Object { $_.Name -like "*$replacement*" }
$matchingCountAfter = $filesMatchingPattern.Count
Write-Host "Number of files matching '$replacement' after renaming: $matchingCountAfter"

# Print the number of files renamed
Write-Host "Number of files renamed: $renamedCount"
