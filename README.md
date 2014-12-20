# My dotfiles
## Targets
- git
- tmux
- vim
- zsh

## Installation
### dotfiles
```sh
cd
git clone https://github.com/kei500/dotfiles
mkdir -p ~/dotfiles/vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vim/bundle/neobundle.vim
cd dotfiles
./setup.sh
```

### vim
```sh
sudo yum -y install mercurial
sudo yum -y install ncurses-devel
mkdir -p ~/local/src
cd ~/local/src
hg clone https://vim.googlecode.com/hg/ vim
cd ~/local/src/vim
./configure --enable-multibyte --with-features=huge --disable-selinux --prefix=~/local
make
make install
sudo ln -s ~/local/bin/vim /usr/local/bin 
```

### tmux
```sh
cd /tmp
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
sudo yum -y install tmux
```

## Remarks
Ricty(リクティ)というフォントが入っていないとtmuxのステータスラインが文字化けするので注意。
