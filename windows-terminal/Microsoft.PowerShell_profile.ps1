##################
### Oh my posh ###
##################

if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
	$theme = "robbyrussell"
	oh-my-posh init pwsh --config "$HOME\.omp-themes\$theme.omp.json" | Invoke-Expression
}


#################
### Fastfetch ###
#################

if (Get-Command fastfetch -ErrorAction SilentlyContinue) {
	fastfetch
}


###############
### Modules ###
###############

if (Get-Module -ListAvailable -Name Terminal-Icons) {
	Import-Module -Name Terminal-Icons
}
if (Get-Module -ListAvailable -Name Microsoft.WinGet.CommandNotFound) {
	Import-Module -Name Microsoft.WinGet.CommandNotFound
}


###############
### Aliases ###
###############

function notes {
	Set-Location "$env:USERPROFILE\Meine Ablage\Vaults\Notes"
}

