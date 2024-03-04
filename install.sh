DIR=$(pwd)

cd ~

mkdir -p .bin

# begin: symlinks
LINKS='bashrc
bash_profile
inputrc
vimrc
gitconfig
gitignore_global
tmux.conf
ssh/config.d'

for L in $LINKS; do
	# check if the file/dir/link exists and backup the existing version
	if [[ -e ".$L" ]]; then
		echo "Backing up .$L"
		mv ".$L" ".$L.backup"
	fi
	echo "Linking .$L"
	ln -s "$DIR/$L" ".$L"
	echo
done
# end: symlinks

# begin: vim
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/autoload
# end: vim

cd $DIR

source bash_includes/functions.sh

compile-ssh-config
