#! /bin/zsh

setopt extendedglob
setopt glob_dots

# Synchronize the git submodules
git submodule init
git submodule update

# Create symlinks
for f in *.sl
do
    new="$HOME/.${f/.sl/}"
    if [[ -e "$new" ]]
    then
        echo "$new alreay exists. Remove it."
        rm -rf "$new"
    fi
    ln -vs "$PWD/$f" "$new"
done
