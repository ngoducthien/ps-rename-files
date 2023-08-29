# File Renaming Script

The PowerShell script offers a convenient solution for both updating the content within files and renaming files in a folder and its subfolders, all based on a specified pattern. Simplify the process of managing and modifying your files in bulk.

## Issue: Renaming Files and Correcting Contents in Output Files

**Problem:**

An automated program has generated numerous output files. Consider the folder structure below as an example:

```
C:\data\TSi:

    - round_1:
        - data_TSi0.2_round_1.dat
        - data_TSi0.2_round_1.gnuplot
        - data_TSi0.2_round_1.info

    - round_2:
        - data_TSi0.2_round_2.dat
        - data_TSi0.2_round_2.gnuplot
        - data_TSi0.2_round_2.info

    - ...

    - round_100:
        - data_TSi0.2_round_100.dat
        - data_TSi0.2_round_100.gnuplot
        - data_TSi0.2_round_100.info
```

**Challenge:**

However, due to a typographical error, the string **TSi0.5** was mistakenly written as **TSi0.2**. Consequently, it has become essential to rename all files within the directory, including subdirectories.

Furthermore, the contents of these files still reference the incorrect filename. For instance, the file **data_TSi0.2_round_1.gnuplot** contains the line:

```gnuplot
plot 'data_TSi0.2_round_1.dat' using 1:2 with lines
```

Hence, there is a need to rectify the file contents that refer to the erroneous old filename.

This guide will walk you through the steps to rename the files and correct the contents of the output files to ensure accurate data representation.

## How to Use

1. **Define Source Folder and Renaming Details:**

   Open the `ps-rename-files.ps1` script in a text editor.

   - Update the `$sourceFolder` variable with the path of the folder containing the files.
   - Set the `$pattern` variable to the part of the filename you want to replace.
   - Define the `$replacement` variable for the new content.

   Example:
   ```powershell
   $sourceFolder = "C:\data\TSi"
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
