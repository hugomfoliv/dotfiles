# Hugo's dotfiles

## Installation
Not yet tested, but should be just run the following commands... 

```
cd $HOME
git clone git@github.com:hugofoliv/dotfiles.git
echo "source $HOME/dotfiles/zsh/zshrc" > .zshrc
echo "so ~/dotfiles/vim/vimrc.vim" > .vimrc
```
Install vim is not installed already 
```
sudo apt install vim
```
Open vim and install plugins 
```
vim
:PlugInstall
```
