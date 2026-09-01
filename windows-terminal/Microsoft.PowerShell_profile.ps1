##################
### Oh my posh ###
##################

$theme = "robbyrussell"
oh-my-posh init pwsh --config "$HOME\.omp-themes\$theme.omp.json" | Invoke-Expression


#############
### Icons ###
#############

Import-Module -Name Terminal-Icons


###############
### Aliases ###
###############

function notes {
	Set-Location "$env:USERPROFILE\Meine Ablage\Vaults\Notes"
}

