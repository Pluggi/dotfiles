#! /bin/zsh

setopt extendedglob
setopt glob_dots

backup="$HOME/dotfiles_old/"

# Synchronize the git submodules
git submodule init
git submodule update

# Create symlinks
for f in *.sl
do
    new="$HOME/.${f/.sl/}"
    if [[ -e "$new" ]]
    then
        mkdir -p "$backup"
        echo "$new alreay exists. Moving it to $backup"
        mv "$(realpath -f $new)" "$backup"
    fi
    ln -vs "$PWD/$f" "$new"
done
