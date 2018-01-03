DIR=$(pwd)

cd ~

LINKS='bashrc
bash_profile
inputrc
vimrc
gitconfig
gitignore_global
spacemacs
spacemacs.d
tmux.conf
vim
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

mkdir -p .bin
ln -s "$DIR/package.json" .bin/package.json
cd .bin

cd $DIR

source bash_includes/functions.sh

compile-ssh-config
