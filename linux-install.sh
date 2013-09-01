#!/bin/sh

if [[ -f $HOME/.vimrc ]]; then
    echo $HOME/.vimrc already exists. Either delete and run this script or just move on.
fi

echo Creating link to $HOME/.vimrc
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
echo Done. Check that Vim loads the plugins correctly.
