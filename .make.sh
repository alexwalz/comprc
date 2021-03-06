#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/comprc                    # dotfiles directory
olddir=~/comprc_old             # old dotfiles backup directory
files="bashrc zshrc vimrc vim tmux.conf"    # list of files/folders to symlink in homedir

##########

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install zsh
  sudo apt-get install silversearcher-ag
  # package to compare floating point numbers
  sudo apt-get install bc
  sudo apt-get install tmux
  sudo apt-get install fortune
  sudo apt-get install cowsay
  sudo apt-get install vim
  sudo apt-get install ranger
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install zsh
  brew install ag
  # package to compare floating point numbers
  brew install bc
  brew install tmux
  brew install fortune
  brew install cowsay
  brew install ranger
fi

# oh my zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# oh my zsh plugins
## syntax highlighting
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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
  mv ~/.$file $olddir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done

# Install Plug for managing Vim plugins
echo "Installing Plug"
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Change permissions on autload file
sudo chmod -R 755 ~/.vim/autoload

# Install the rest of the plugins
echo "Installing All Vim Plugins"
sudo vim +PlugInstall +qall

 #Change permissions on autload file...already do this up above
#sudo chmod -R 755 ~/.vim/autoload

# Make fzf history public
sudo chmod -R 755 ~/.local/share/fzf-history

# switch to zsh shell
sudo chsh -s /bin/zsh

# Source bashrc in bash profile
#sudo echo "source ~/.bashrc" >> ~/.bash_profile

# Source zshrc in zprofile
#sudo echo "source ~/.zshrc" >> ~/.zprofile

# Clear the screen
clear

tmux
