############################
### Install applications ###
############################

$programms = @(
	"Git.Git",                     # git
	"JanDeDobbeleer.OhMyPosh",     # oh-my-posh
	"Fastfetch-cli.Fastfetch",     # fastfetch
	"Neovim.Neovim",               # neovim
	"Microsoft.WindowsTerminal",   # windows terminal
	"Microsoft.VisualStudioCode",  # vscode
	"Microsoft.PowerShell"         # powershell
)

# Installs programms only for the current user
foreach ($programm in $programms) {
	winget install $programm --scope user
}


################
### Symlinks ###
################

# Pwsh profile
$params = @{
	ItemType = "SymbolicLink"
	Path     = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
	Target   = "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
	Force    = $true
}
New-Item @params # splatting

# Windows terminal settings
$params = @{
	ItemType = "SymbolicLink"
	Path     = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
	Target   = "$HOME\.dotfiles\windows-terminal\settings.json"
	Force    = $true
}
New-Item @params

# VSCode keybindings and settings
$params = @{
	ItemType = "SymbolicLink"
	Path     = "$env:APPDATA\Code\User\keybindings.json"
	Target   = "$HOME\.dotfiles\vscode\keybindings.json"
	Force    = $true
}
New-Item @params

$params = @{
	ItemType = "SymbolicLink"
	Path     = "$env:APPDATA\Code\User\settings.json"
	Target   = "$HOME\.dotfiles\vscode\settings.json"
	Force    = $true
}
New-Item @params

# Oh my posh themes directory
$params = @{
	ItemType = "SymbolicLink"
	Path     = "$HOME\.omp-themes"
	Target   = "$HOME\.dotfiles\omp-themes"
	Force    = $true
}
New-Item @params

# Fastfetch settings
$params = @{
	ItemType = "SymbolicLink"
	Path     = "$HOME\.config\fastfetch"
	Target   = "$HOME\.dotfiles\fastfetch"
	Force    = $true
}
New-Item @params

# Neovim settings
$params = @{
	ItemType = "SymbolicLink"
	Path     = "$env:LOCALAPPDATA\nvim"
	Target   = "$HOME\.dotfiles\nvim"
	Force    = $true
}
New-Item @params

# TODO: add latexmkrc


Write-Host "Installation finished!"

