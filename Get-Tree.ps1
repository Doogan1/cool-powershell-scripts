# Prints a graphical representation of the directory as a tree
function Get-Tree {
    param (
        [string]$Path = ".",     # Default to the current directory
        [string]$Indent = "",    # Optional indentation for nested directories
        [string[]]$IgnoreDirs    # List of directory names to ignore
    )

    # Ensure the Path is valid
    if (-Not (Test-Path -Path $Path)) {
        Write-Output "Error: Path '$Path' does not exist."
        return
    }

    # Get all items in the current directory
    Get-ChildItem -Path $Path | ForEach-Object {
        # Skip directories in the IgnoreDirs list
        if ($_.PSIsContainer -and $IgnoreDirs -contains $_.Name) {
            return
        }

        # Print the current item with indentation
        Write-Output "$Indent|- $_"

        # If the item is a directory, recursively call Get-Tree
        if ($_.PSIsContainer) {
            Get-Tree -Path $_.FullName -Indent "$Indent  " -IgnoreDirs $IgnoreDirs
        }
    }
}
