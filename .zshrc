# Set up environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export GOPATH=$(go env GOPATH)
export PATH="/Users/michael.lundin/Tools/flutter/bin:$PATH"
export PATH="/Users/michael.lundin/bin:/usr/local/opt/mongodb@3.2/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/mongodb@3.4/bin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="~/.local/bin:$PATH"
export PATH="/usr/local/opt/mongodb-community@3.4/bin:$PATH"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

# Load aliases
source ~/.aliases

# Bind special keys
bindkey "^[[3~" delete-char
bindkey '\e[H' beginning-of-line
bindkey '\e[F' end-of-line

# Add add-zsh-hook command
autoload -U add-zsh-hook

# Set window title (or tab title) to the current directory
set-window-title() {
	echo -ne "\e]1;`basename ${PWD}`\a"
}
add-zsh-hook precmd set-window-title
set-window-title

# Powerlevel9k theme configuration -- controls prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time dir nvm vcs newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_left"
POWERLEVEL9K_TIME_BACKGROUND="grey"
POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_TIME_FORMAT="%D{%l:%M:%S %p}"
source  ~/Tools/powerlevel9k/powerlevel9k.zsh-theme

# Allow for GIT tab completion
autoload -Uz compinit && compinit

# Enables colors and sets different colors for different file types
export CLICOLOR=1
export LSCOLORS=dxfxcxdxbxegedabagacad

# Sets up NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" != "N/A" ] && [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

set-node-path() {
  if [ "$PWD" == "/Users/michael.lundin/Projects/ifit/ifit" ]
  then
		export NODE_PATH="$(pwd)"
		echo "Setting NODE_PATH to $(pwd)"
	elif [[ "$PWD" != "/Users/michael.lundin/Projects/ifit/ifit"* ]]
	then
		export NODE_PATH=""
  fi
}
add-zsh-hook chpwd set-node-path

# Allows for the "code ." cli shortcut
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Enables fuck command
eval $(thefuck --alias)

# Enables Python's virtualenvwrapper tool
source /usr/local/bin/virtualenvwrapper.sh

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Sets up the AWS-Credentials as per the devops script
source .aws-credentials
