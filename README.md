# These are my dotfiles

## Installation
Not yet tested, but should be just run the following commands...

```bash
cd $HOME
git clone --recurse-submodules git@github.com:hugofoliv/dotfiles.git
echo "source $HOME/dotfiles/zsh/zshrc" > .zshrc
echo "so ~/dotfiles/vim/vimrc.vim" > .vimrc
```

### Install zsh fonts
```bash
apt-get install fonts-powerline
```
And open `zsh/fonts` and install all fonts within

### Install vim if is not already installed
#### Ubuntu / debian
```bash
apt install vim
```
#### CentOS / Red Hat
```bash
yum install vim
```

### Open vim and install plugins
```bash
vim
:PlugInstall
```

### Source gitconfig file
```bash
cd $HOME
cat > .gitconfig <<EOL
[include]
    path = dotfiles/gitconfig
EOL

```
