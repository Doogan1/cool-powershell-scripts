# cool-powershell-scripts

A collection of useful and fun PowerShell scripts to enhance productivity and simplify common tasks. Each script is designed to be modular, well-documented, and easy to use.

---

## Functions

### 1. `Get-Tree`

#### Description
`Get-Tree` is a script that generates a visual tree structure of a directory and its contents. It displays files and subdirectories hierarchically, with an option to ignore specific directories.

#### Parameters
- **`-Path`**: The root directory to visualize. Defaults to the current directory (`.`).
- **`-Indent`**: Internal use for recursion; controls the visual indentation of tree items. You don't need to provide this manually.
- **`-IgnoreDirs`**: A list of directory names to exclude from the tree visualization.

#### Example Usage

1. **Visualize the current directory**:
   ```powershell
   Get-Tree
   ```

2. **Visualize a specific directory**:
   ```powershell
   Get-Tree -Path "C:\MyProject"
   ```

3. **Exclude specific directories**:
   ```powershell
   Get-Tree -Path "C:\MyProject" -IgnoreDirs @("venv", ".git")
   ```

#### Sample Output
Running `Get-Tree -Path "C:\MyProject"` might produce:
```
|- file1.txt
|- file2.txt
|- Subdirectory1
  |- file_in_subdir.txt
|- Subdirectory2
  |- AnotherFile.docx
```

---

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/cool-powershell-scripts.git
   ```
   
2. Import the function in your PowerShell session:
   ```powershell
   Import-Module ./cool-powershell-scripts/Get-Tree.ps1
   ```

3. Run the function:
   ```powershell
   Get-Tree -Path "C:\SomeDirectory"
   ```

---

## Contributing

Have a cool PowerShell script you'd like to share? Feel free to open an issue or submit a pull request. Let's grow this collection together!

---

## License

This repository is licensed under the MIT License. See [LICENSE](LICENSE.md) for details.
