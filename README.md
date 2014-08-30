This is my vim configuration: .vim for Unix, vimfiles for Windows.
The purpose of this repository is to make setting up vim on new computers
(esp. vitual machines) easier.

Setup (Linux):
- Install git and vim
- Clone the repository into the .vim directory:
    git clone https://github.com/Solumin/solumin.vim.git ~/.vim
- cd into the new .vim directory and run linux-install.sh

Setup (Windows):
- Install Github for Windows and GVim
- Clone the repository into the main Github folder
- Open the new repository in Explorer and run windows-install.bat as administrator

I'm using pathogen as my plugin manager, because Vundle seems to be a little
more than I need at the moment.

Install Checklist:
- Submodules (should be handled automatically on Linux)
- Envy Code R

**To update submodules**

```git submodule foreach git pull```
