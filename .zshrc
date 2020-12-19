# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/minoru.nakamura/.sdkman"
[[ -s "/Users/minoru.nakamura/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/minoru.nakamura/.sdkman/bin/sdkman-init.sh"
#export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"
export PATH=$PATH:/Users/minoru.nakamura/development/flutter/bin
export PATH=$PATH:~/.nodebrew/current/bin/

# 環境変数
export LANG=ja_JP.UTF-8

# 日本語ファイルを扱えるようにする
setopt print_eight_bit

# プロンプト複数起動時のhistory
setopt share_history

# 重複するコマンドのhistory削除
setopt hist_ignore_all_dups

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit cdclear -q
setopt promptsubst
zinit snippet OMZT::gnzh
zinit light NicoSantangelo/Alpharized

# Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# 補完
zinit light zsh-users/zsh-autosuggestions

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# 
zinit light zsh-users/zsh-completions

#
zinit light zsh-users/zsh-history-substring-search

# Ctrl+r でコマンド履歴検索
zinit light zdharma/history-search-multi-word

# 色を使用出来るようにする
autoload -Uz colors
colors
 
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# ヒストリ (履歴) を保存、数を増やす
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

PROMPT='%F{blue}%m@%n%f %F{red}%~%f$ '

# Alias
alias ll='ls -G -la'
alias vi='vim'

# 補完機能有効にする
autoload -U compinit
compinit -u

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
