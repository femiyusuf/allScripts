#PATH=${PATH}:${HOME}/bin
#PATH=${PATH}:/home/myusuf/Downloads/utilities
#PATH=${PATH}:/Users/myusuf/Downloads/android-sdk-macosx/platform-tools
PATH=${PATH}:/Users/myusuf/Library/Android/sdk/platform-tools
PATH=${PATH}:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
#PATH=${PATH}:"/Applications/Sublime Text.app/Contents/MacOS"
PATH=${PATH}:"/Users/myusuf/Library/Python/3.7/bin"

# Inserted for shodan
PATH=$PATH:/Library/Frameworks/Python.framework/Versions/2.7/bin
export PATH

#######################################################
# ssh-agent setup
#######################################################
AInfo="${HOME}/.ssh/agent-info-${HOSTNAME}"

SetupAgent(){

   pgrep ssh-agent 1> /dev/null
   if [ $? -eq 0 ]; then
       . $AInfo
       echo $0: if
   else
       echo $0: else
       ssh-agent -s > $AInfo
       ssh-add
   fi

}

lg(){

   grep $* /home/myusuf/home/work/ss
}



SetupAgent


if [ ! -S $SSH_AUTH_SOCK ]; then

  SetupAgent

fi

if [ ! -O /proc/${SSH_AGENT_PID} ]; then

  SetupAgent

fi
#######################################################
# source the $HOME/.bashrc
#######################################################
source $HOME/.bashrc
#PS1='[\u@myusuf-mac]\n`pwd` \!> '
# \w = ~
#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[33m\]\w\[\e[0m\] `pwd` > '
#PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@lglt04-myusuf.corp.netflix.com\[\e[33m\]\[\e[0m\]:`pwd` > '
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h\[\e[33m\]\[\e[0m\] `pwd` > '

# enable vi mode
set -o vi

##
# Your previous /Users/myusuf/.bash_profile file was backed up as /Users/myusuf/.bash_profile.macports-saved_2014-04-04_at_18:36:56
##

# MacPorts Installer addition on 2014-04-04_at_18:36:56: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# Perlbrew
source ~/perl5/perlbrew/etc/bashrc

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH

#### iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

################## Command completion section ###################
# Setup Bash completion
# - Bash completion is a prerequisite for all other command completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

