# Set up environment variables
export ANDROID_HOME=$HOME/Library/Android/sdk
export GOPATH=$(go env GOPATH)
export PATH="/Users/michael.lundin/Tools/flutter/bin:$PATH"
export PATH="/Users/michael.lundin/bin:/usr/local/opt/mongodb@3.2/bin:$PATH"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$GOPATH/bin
export NODE_PATH="/Users/michael.lundin/Projects/ifit/ifit"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_171.jdk/Contents/Home
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel

# Bind special keys
bindkey "^[[3~" delete-char

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

# Allows for the "code ." cli shortcut
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}


# Enables fuck command
eval $(thefuck --alias)

# Enables Python's virtualenvwrapper tool
source /usr/local/bin/virtualenvwrapper.sh
