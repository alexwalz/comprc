# If you come from bash you might have to change your $PATH.
	# export PATH=$HOME/bin:/usr/local/bin:$PATH

	export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

# Path to your oh-my-zsh installation.
export ZSH=/Users/alexwalz/.oh-my-zsh
export EDITOR='vim'
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)



plugins=(
git zsh-autosuggestions brew osx colored-man-pages
)

source $ZSH/oh-my-zsh.sh

get_latest_package () { asdf list-all $1 | egrep '^[^a-zA-Z]+$' | sed -Ee 's/^(.*-)([0-9.]+)(\.ime)$/\2.-1 \1\2\3/' | sort -t. -n -k1,1 -k2,2 -k3,3 -k4,4 | cut -d\  -f2- | tail -n 1 ; }


#Docker
alias dc="docker-compose"
alias d="docker"
alias dprune="docker system prune -a --volumes"

alias ls='ls -GF'
alias gpu='git push --set-upstream origin'
alias nb='git checkout -b'
alias get='mix deps.get'
alias env='source .env'
alias cdr='foo(){ cd ~/repos/"$1"}; foo 

gmm(){
  git checkout master
  git pull origin master
  git checkout -
  git merge master
  git push
}


phx() {
	source .env
	iex -S mix phx.server
}

# Git
alias co="git checkout"
alias gs="git status"
alias gpm="git pull origin master"
alias gp="git pull"


#Podium Aliases
black_mamba(){
	cdr platform
	dc stop black-mamba-web
	cdr black_mamba
  git pull
	code .
	source .env
	mix deps.get
	mix ecto.migrate
	iex -S mix phx.server
}
akron_hammer(){
	cdr platform
	dc stop akron-hammer
	cdr akron_hammer
  git pull
	code .
	source .env
	mix deps.get
	mix ecto.migrate
	iex -S mix phx.server
}

simon(){
	cdr simon
  git pull
	code .
	source .env
	mix deps.get
	mix ecto.migrate
	iex -S mix phx.server
}
magic(){
	cdr platform
	dc stop magic-web
	cdr magic 
  git pull
	code .
	source .env
	mix deps.get
	mix ecto.migrate
	iex -S mix phx.server
}
kazaam(){
	code .
	cdr kazaam
	git pull
	yarn install
	yarn start
}
stormcrow(){
	cdr platform
	dc stop stormcrow
	cdr stormcrow 
  git pull
	code .
	source .env
	mix deps.get
	mix ecto.migrate
	iex -S mix phx.server
}
review_rocket(){
	cdr platform
	dc stop review-rocket-web
	cdr review_rocket
	code .
	git pull
	bundle install
	rake db:migrate
	bundle exec rails s
}
rapidash(){
	cdr rapidash
	code .
	git pull
	npm install
	mix deps.get
	iex -S mix phoenix.server
}

export PATH="$PATH:/usr/local/opt/node@8/bin"
export PATH="/usr/local/Cellar/rabbitmq/3.7.7_1/sbin:$PATH"

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
export PATH="/usr/local/sbin:$PATH"
source ~/.bin/tmuxinator.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/curl/bin:$PATH"
source /Users/alexwalz/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"