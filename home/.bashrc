# Ruby on Rails Development
alias bake='bundle exec rake $1'
alias be='bundle exec $1'

alias xcuc='xvfb-run bundle exec cucumber'
alias be='bundle exec'
alias bake='bundle exec rake'

alias editp='vim ~/.bashrc'
alias sourcep='. ~/.bashrc'
alias editv='vim ~/.vimrc'

alias gt='ctags -R --exclude=.git --exclude=node_modules --exclude=tmp .'

export PS1="\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# inQwizIt Environment Variables
export DB_HOST="127.0.0.1"
export DB_USER="root"
export DB_PASS="isd"

# Git branch in prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -d "app" ]; then
  cd app
fi
