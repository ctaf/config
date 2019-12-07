# Install dependencies
sudo apt install exuberant-ctags
sudo apt install python3-pip
python3 -m pip install pynvim
sudo apt install powerline
sudo apt-get install dconf-cli

# Solarized for Gnome Terminal
git clone https://github.com/aruhier/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./set_dark.sh
rm -rf gnome-terminal-colors-solarized

# Link basic configuration
ln -s .vimrc $HOME/.vimrc
ln -s .zshrc $HOME/.zshrc

# Install Vundle
mkdir -p $HOME/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall
