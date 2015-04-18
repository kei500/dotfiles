#!/bin/sh

for rc in gemrc gitconfig screenrc tmux.conf tmux-powerlinerc zshrc vim vimrc
do
  rm -f ~/.$rc && ln -s ~/dotfiles/$rc ~/.$rc
done

rm -f ~/.vimshrc && ln -s ~/dotfiles/zshrc.alias ~/.vimshrc

rm -rf ~/dotfiles/tmux/tmux-powerline
git clone https://github.com/erikw/tmux-powerline ~/dotfiles/tmux/tmux-powerline
ln -s ~/dotfiles/tmux/my-tmux-powerline/themes/mytheme.sh ~/dotfiles/tmux/tmux-powerline/themes/mytheme.sh
patch -u ~/dotfiles/tmux/tmux-powerline/segments/vcs_branch.sh < ~/dotfiles/tmux/my-tmux-powerline/segments/vcs_branch.patch
