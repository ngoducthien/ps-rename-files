# Define the source folder
$sourceFolder = "C:\path\to\your\folder"

# Define the pattern to search for in filenames and content
$pattern = "_TSi0.2_"

# Define the replacement pattern for filenames and content
$replacement = "_TSi0.5_"

# Print the source folder
Write-Host "The source folder: $sourceFolder"

# Get all files in the source folder and its subfolders
$files = Get-ChildItem -Path $sourceFolder -Recurse | Where-Object { !$_.PSIsContainer }

# Loop through each file and update content and rename if necessary
$updatedCount = 0
$renamedCount = 0
foreach ($file in $files) {
    $fileContent = Get-Content -Path $file.FullName -Raw
    if ($fileContent -match $pattern) {
        # Update content
        $newContent = $fileContent -replace [regex]::Escape($pattern), $replacement
        $newContent | Set-Content -Path $file.FullName

        # Rename file
        $newName = $file.Name -replace [regex]::Escape($pattern), $replacement
        Rename-Item -Path $file.FullName -NewName $newName

        $updatedCount++
        $renamedCount++
    }
    elseif ($file.Name -like "*$pattern*") {
        # Rename file only
        $newName = $file.Name -replace [regex]::Escape($pattern), $replacement
        Rename-Item -Path $file.FullName -NewName $newName

        $renamedCount++
    }
}

# Print the number of files with content updated and renamed
Write-Host "Number of files with content updated and renamed: $updatedCount"
Write-Host "Number of files renamed only: $renamedCount"
