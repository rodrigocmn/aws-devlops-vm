# PATH
PATH=$PATH:$HOME/.local/bini:$HOME/bin

# Powerlevel9k config
POWERLEVEL9K_MODE='nerdfont-complete'
source  /opt/powerlevel9k/powerlevel9k.zsh-theme
#source $(dirname $(gem which colorls))/tab_complete.sh

# Customise the Powerlevel9k prompts
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  custom_vagrant
  root_indicator
  context
  dir
  vcs
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true

POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='001'

POWERLEVEL9K_DIR_HOME_BACKGROUND='220'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='white'
POWERLEVEL9K_DIR_ETC_BACKGROUND='white'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='white'

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='0'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='white'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

# Add the custom Vagrant prompt segment
POWERLEVEL9K_CUSTOM_VAGRANT="echo -n '\uf270'"
POWERLEVEL9K_CUSTOM_VAGRANT_FOREGROUND="black"
POWERLEVEL9K_CUSTOM_VAGRANT_BACKGROUND="220"


# Aliases

alias lc='colorls -lA --sd'
alias ll='colorls -al'
alias l='colorls -1'

# Neofetch
neofetch