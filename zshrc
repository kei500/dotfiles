# 基本設定
# export TERM=xterm-256color
export EDITOR=vim           # エディタをvimに設定
export LANG=ja_JP.UTF-8     # 文字コードをUTF-8に設定
setopt no_beep              # ビープ音を鳴らさないようにする
setopt auto_cd              # ディレクトリ名と一致した場合にcd
setopt auto_pushd           # cd時にディレクトリスタックにpushd
autoload -U colors; colors  # 色を使用できるようにする
setopt prompt_subst         # プロンプトに式展開を適用
export LSCOLORS=gxfxcxdxbxegedabagacad  # lsの色設定

# VCSのブランチ名をプロンプトに表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
precmd () {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}

# キーバインド
bindkey '^Z' beginning-of-line
bindkey '^E' end-of-line

# プロンプト
PROMPT="%{${fg[yellow]}%}%/%{${reset_color}%} "
PROMPT2="%{${fg[yellow]}%}%_%{${reset_color}%} "
SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
RPROMPT="%1(v|%F{green}%1v%f|)"
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%{${fg[cyan]}%}%n@${HOST%%.*} ${PROMPT}"

# 補完
autoload -U compinit; compinit  # 補完機能を有効にする
setopt auto_list                # 補完候補を一覧で表示する
setopt auto_menu                # 補完キー連打で補完候補を順に表示する
setopt auto_param_keys          # 括弧などを自動的に補完
setopt auto_param_slash         # ディレクトリの補完時に末尾に/を付加
setopt complete_aliases         # エイリアスを設定したコマンドにも補完機能を適用
setopt correct                  # コマンドを修正
setopt correct_all              # コマンドだけでなくファイル名等も修正
setopt hist_expand              # 補完時にヒストリを展開
setopt list_packed              # 補完候補を詰めて表示する
setopt list_types               # 補完候補にファイルの種類も表示する
setopt magic_equal_subst        # =以降も補完する
setopt mark_dirs                # 補完対象がディレクトリの場合末尾に/を付加
setopt nolistbeep               # 補完表示時にビープ音を鳴らさない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 大文字小文字を区別しない

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # 連続して重複したコマンドラインはヒストリに追加しない
setopt share_history        # 履歴の共有
setopt hist_no_store        # historyコマンドをhistoryに保存しない
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに記録する
setopt extended_history     # 履歴ファイルに時刻を記録
setopt inc_append_history   # 履歴をインクリメンタルに追加
setopt hist_ignore_space    # スペースで始まるコマンド行はヒストリリストから削除
setopt hist_verify          # ヒストリを呼び出してから実行する間に一旦編集可能
autoload history-search-end
# 履歴検索機能のショートカット
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# エイリアス
source ~/dotfiles/zshrc.alias

# manコマンドに色をつける
export MANPAGER='less -R'
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

# その他
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/local/bin:$PATH"
eval "$(rbenv init -)"
source ~/perl5/perlbrew/etc/bashrc
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'
