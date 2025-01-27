#Prints a graphical representation of the directory tree
function Get-Tree {
    param (
        [string]$Path = ".",
        [string]$Indent = "",
        [string[]]$IgnoreDirs = @(),
        [int]$Depth = [int]::MaxValue
    )
    
    if ($Depth -le 0) {
        return
    }
    
    try {
        Get-ChildItem -Path $Path | ForEach-Object {
            if ($_.PSIsContainer) {
                # Skip directories in IgnoreDirs list
                if ($IgnoreDirs -contains $_.Name) {
                    return
                }
                
                # Output directory name
                Write-Output "$Indent|- $($_.Name)"
                
                # Recursively explore subdirectories
                Get-Tree -Path $_.FullName -Indent "$Indent  " -IgnoreDirs $IgnoreDirs -Depth ($Depth - 1)
            }
            else {
                # Output file name
                Write-Output "$Indent  |- $($_.Name)"
            }
        }
    }
    catch {
        Write-Output "Error: $_"
    }
}

# Example usage:
#Get-Tree -Path "C:\Users\Drake\finance-network" -IgnoreDirs @("venv", ".git", "node_modules") -Depth 5
