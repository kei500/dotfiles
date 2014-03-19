%w(
gitconfig
tmux.conf
tmux-powerlinerc
zshrc
vim
vimrc
).each do |dotfile|
  cmd = "ln -s #{File.join('~', 'dotfiles', dotfile)} ~/.#{dotfile}"
  puts cmd
  system cmd
end

cmd = "ln -s #{File.join('~', 'dotfiles', 'zshrc.alias')} ~/.vimshrc"
puts cmd
system cmd

cmd = "ln -s #{File.join('~', 'dotfiles', 'tmux', 'my-tmux-powerline', 'themes', 'mytheme.sh')} "
cmd += File.join('~', 'dotfiles', 'tmux', 'tmux-powerline', 'themes', 'mytheme.sh')
puts cmd
system cmd

cmd = "patch -u #{File.join('~', 'dotfiles', 'tmux', 'tmux-powerline', 'segments', 'vcs_branch.sh')} < "
cmd += File.join('~', 'dotfiles', 'tmux', 'my-tmux-powerline', 'segments', 'vcs_branch.patch')
puts cmd
system cmd
