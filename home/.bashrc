# Ruby on Rails Development
alias bake='bundle exec rake $1'
alias be='bundle exec $1'

alias xcuc='xvfb-run bundle exec cucumber'
alias be='bundle exec'
alias bake='bundle exec rake'

alias editp='vim ~/.bashrc'
alias sourcep='. ~/.bashrc'
alias editv='vim ~/.vimrc'

export EDITOR=vim

alias gt='ctags -R --exclude=.git --exclude=node_modules --exclude=tmp .'

# inQwizIt Environment Variables
export DB_HOST="127.0.0.1"
export DB_USER="root"
export DB_PASS="isd"

# Only load Liquid Prompt in interactive shells, not from a script or from scp
#[[ $- = *i* ]] && source ~/repos/liquidprompt/liquidprompt

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# Aliases that are portable between shells (e.g. sh, bash, zsh)
[ -f ~/.aliases ] && source ~/.aliases

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
