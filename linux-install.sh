#!/bin/bash

if [[ -f $HOME/.vimrc ]]; then
    echo $HOME/.vimrc already exists. Delete it and rerun this script
    exit 1
fi

echo Initializing submodules...
cd $HOME/.vim/bundle
git submodule init
echo Cloning submodules...\n
git submodule update
cd $HOME/.vim
echo \n

echo Creating link to $HOME/.vimrc
ln -s $HOME/.vim/.vimrc $HOME/.vimrc
echo Done. Check that Vim loads the plugins correctly.

echo Installing the Envy Code R font...
echo How do you wish to install the font?
select choice in "Yaourt" "Download" "I'll do it later"; do
    case $choice in
        Yaourt )
            echo Installing through yaourt. This may take a minute.
            yaourt -S ttf-envy-code-r
            ;;
        Download ) 
            echo Downloading and installing the font to ~/.fonts/truetype
            echo This will require rebuilding the font cache
            if [ ! -d $HOME/.fonts/truetype ]; then
                mkdir $HOME/.fonts/truetype -p
            fi
            cd $HOME/.fonts/truetype
            echo Downloading the font...
            curl -O download.damieng.com/fonts/original/EnvyCodeR-PR7.zip
            echo Unzipping...
            unzip EnvyCodeR-PR7.zip
            echo Recreating font cache
            sudo fc-cache -f -v
            rm EnvyCodeR-PR7.zip
            ;;
        * ) echo Ok, but you better not forget
            ;;
    esac
    break
done

echo That should be just about everything. Exiting!
exit 0
