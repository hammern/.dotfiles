DOTFILES_DIR="/home/hammern/.dotfiles"

hostname=$(fzf --height=8 --border --border-label="Select a hostname" <$DOTFILES_DIR/install/hostnames.txt)

if [[ -z $hostname ]]; then
	echo "Hostname not selected, exiting..."
	exit 0
fi

git clone https://github.com/hammern/.dotfiles "$DOTFILES_DIR"

cd "$DOTFILES_DIR"
git remote rm origin
git remote add origin git@github.com:hammern/.dotfiles.git

nixos-generate-config --show-hardware-config >"$DOTFILES_DIR"/hosts/"$hostname"/hardware-configuration.nix

export FLAKE="$DOTFILES_DIR"
nh os switch -H "$hostname"
nh home switch -c hammern@"$hostname"

echo "All done! Please reboot the system"
