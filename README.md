# File Renaming Script

This PowerShell script lets you rename files in a folder and its subfolders based on a specified pattern. Simplify the process of bulk renaming with ease.

## How to Use

1. **Define Source Folder and Renaming Details:**

   Open the `ps-rename-files.ps1` script in a text editor.

   - Update the `$sourceFolder` variable with the path of the folder containing the files.
   - Set the `$pattern` variable to the part of the filename you want to replace.
   - Define the `$replacement` variable for the new content.

   Example:
   ```powershell
   $sourceFolder = "C:\path\to\your\folder"
   $pattern = "_TSi0.2_"
   $replacement = "_TSi0.5_"
   ```

2. **Run the Script:**

   Open PowerShell by pressing Win + X and selecting "Windows PowerShell" or "Windows PowerShell (Admin)".

   Navigate to the directory where you saved the script:

   Run the script by entering its filename (without the .ps1 extension) and press Enter:

   ```powershell
   .\ps-rename-files
   ```

   The script will process and rename files as specified.

3. **Note:**

   Always backup your files before running scripts on important data.
