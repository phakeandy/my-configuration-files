Set-PSReadLineOption -EditMode Emacs

# starship 初始化脚本
# Invoke-Expression (&starship init powershell) 

# ====================
# Environment Variable
# ====================
$Env:Path += ";D:\Applications\phpstudy_pro\Extensions\MySQL5.7.26\bin" # phpstudy's mysql
$Env:Path += ";D:\Applications\phpstudy_pro\Extensions\php\php7.3.4nts" # php 7.3
$Env:Path += ";C:\Program Files\Google\Chrome\Application"
$Env:Path += ";C:\Program Files (x86)\Everything"

# =========
# Set Alias
# =========
Set-Alias -Name es -Value everything.exe
Set-Alias -Name grep -Value findstr
Set-Alias -Name open -Value start
Set-Alias -Name ccat -Value Get-Content

# ========
# function
# ========
function gpwd {
    param (
        [string]$currentDir = (Get-Location).Path
    )
    python D:\Code\Python\change_file_path.py $currentDir
}