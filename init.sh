#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################
# Install CURL
sudo apt-get install curl

# Install VIM
sudo apt-get install vim

# Install pathoget for VIM
mkdir -p ~/.vim/autoload ~/.vim/bundle 
curl 'www.vim.org/scripts/download_script.php?src_id=19375' > ~/.vim/autoload/pathogen.vim

# Install VIM solarized theme if not installed
if [ -d "../.vim/bundle/vim-colors-solarized" ]; then
    echo "Solarized VIM theme installed"
else
    echo "Solarized VIM theme not installed"
    mkdir -p ~/.vim/bundle
    git clone git://github.com/altercation/vim-colors-solarized.git
    mv vim-colors-solarized ~/.vim/bundle/
fi

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc gitconfig profile"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Install solarized terminal theme if not already installed.
if [ -d "./gnome-terminal-colors-solarized" ]; then
    echo "Solarized Terminal theme installed"
else
    echo "Solarized Terminal theme not installed"
    git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
    cd gnome-terminal-colors-solarized
    ./solarize
    cd
fi


