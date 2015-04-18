#!/bin/sh

rm -f ~/.gemrc
rm -f ~/.gitconfig
rm -f ~/.screenrc
rm -f ~/.tmux.conf
rm -f ~/.tmux-powerlinerc
rm -f ~/.zshrc
rm -f ~/.vim
rm -f ~/.vimrc
rm -f ~/.vimshrc
rm -rf ~/dotfiles/tmux/tmux-powerline

ln -s ~/dotfiles/gemrc            ~/.gemrc
ln -s ~/dotfiles/gitconfig        ~/.gitconfig
ln -s ~/dotfiles/screenrc         ~/.screenrc
ln -s ~/dotfiles/tmux.conf        ~/.tmux.conf
ln -s ~/dotfiles/tmux-powerlinerc ~/.tmux-powerlinerc
ln -s ~/dotfiles/zshrc            ~/.zshrc
ln -s ~/dotfiles/vim              ~/.vim
ln -s ~/dotfiles/vimrc            ~/.vimrc
ln -s ~/dotfiles/zshrc.alias      ~/.vimshrc
git clone https://github.com/erikw/tmux-powerline ~/dotfiles/tmux/tmux-powerline
ln -s ~/dotfiles/tmux/my-tmux-powerline/themes/mytheme.sh ~/dotfiles/tmux/tmux-powerline/themes/mytheme.sh
patch -u ~/dotfiles/tmux/tmux-powerline/segments/vcs_branch.sh < ~/dotfiles/tmux/my-tmux-powerline/segments/vcs_branch.patch
