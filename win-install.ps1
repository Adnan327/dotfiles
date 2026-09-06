############################
### Install applications ###
############################

$programs = @(
	"Git.Git"                     # git
	"JanDeDobbeleer.OhMyPosh"     # oh-my-posh
	"Fastfetch-cli.Fastfetch"     # fastfetch
	"Neovim.Neovim"               # neovim
	"Microsoft.WindowsTerminal"   # windows terminal
	"Microsoft.VisualStudioCode"  # vscode
	"Microsoft.PowerShell"        # powershell
)

# Installs only programs with this exact ID
foreach ($program in $programs) {
	winget install --id $program --exact
}


#######################
### Install modules ###
#######################

$modules = @(
	"Terminal-Icons"
	"Microsoft.WinGet.CommandNotFound"
)

# Installs modules only for the current user
foreach ($module in $modules) {
	if (-not (Get-Module -ListAvailable -Name $module)) {
		Install-PSResource -Name $module -Scope CurrentUser
	}
}


################
### Symlinks ###
################

# Path = link
# Target = original directory/file

$paths = @(
	# Pwsh profile
	@{
		Path     = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
		Target   = "$HOME\.dotfiles\powershell\Microsoft.PowerShell_profile.ps1"
	}
	# Windows terminal settings
	@{
		Path     = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
		Target   = "$HOME\.dotfiles\windows-terminal\settings.json"
	}
	# VSCode keybindings and settings
	@{
		Path     = "$env:APPDATA\Code\User\keybindings.json"
		Target   = "$HOME\.dotfiles\vscode\keybindings.json"
	}
	@{
		Path     = "$env:APPDATA\Code\User\settings.json"
		Target   = "$HOME\.dotfiles\vscode\settings.json"
	}
	# Oh my posh themes directory
	@{
		Path     = "$HOME\.omp-themes"
		Target   = "$HOME\.dotfiles\omp-themes"
	}
	# Fastfetch settings
	@{
		Path     = "$HOME\.config\fastfetch"
		Target   = "$HOME\.dotfiles\fastfetch"
	}
	# Neovim settings
	@{
		Path     = "$env:LOCALAPPDATA\nvim"
		Target   = "$HOME\.dotfiles\nvim"
	}
	# TODO: add latexmkrc
)

foreach ($path in $paths) {
	New-Item -ItemType SymbolicLink @path -Force # splatting
}


Write-Host "Installation finished!"

