read -p "Install homebrew and basic packages now? [y/n] " -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	if [[ ! $(which brew) ]]; then
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	fi

	brew update > /dev/null 2>&1

	cat homebrew_packages | xargs brew install
fi
