#! /bin/zsh

autoload colors && colors
setopt extendedglob
setopt glob_dots

# Synchronize the git submodules
git submodule init
git submodule update

# Create symlinks
for f in *.sl
do
    new="${HOME%/}/.${f/.sl/}"
    f="${PWD%/}/$f"
    if [[ -e "$new" ]]
    then
        echo "$fg[red]Replacing $new…$reset_color"
        rm -rf "$new"
    fi
    ln -s "$f" "$new" && echo "$fg[green]Linked $new to $f$reset_color\n"
done

vundle="~/.vim/bundle/Vundle.vim"

if [ ! -d "${vundle}" ]; then
    echo -n "Install vundle ? "
    read -rs -k 1 ans
    case "${ans}" in
        y|Y|$'\n')
            echo
            git clone https://github.com/VundleVim/Vundle.vim.git "${vundle}"
            vim +PluginInstall +qall
        ;;
        *)
            echo "Vundle won't be installed"
        ;;
    esac
fi
