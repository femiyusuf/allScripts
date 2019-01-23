# ~/.bashrc 
# executed by login and subshells

# aliases

# search man pages by subject
alias a='man -k'

# edit and re-read this file
alias be='$EDITOR ~/.bashrc ; source ~/.bashrc'

# add the current directory to the "cdpath"
alias cdpath='pwd >> ~/.cdpath ; export CDPATH=`colonise ~/.cdpath`'

# abbreviations for some common commands
alias p='cd $HOME/work/aws'
alias f=finger
alias x='xterm&'
alias h=history
alias d='date "+%Y-%m-%d %H:%M"'
alias c=clear
alias cs="clear && printf '\e[3J'"
alias j=jobs
alias g='/Users/myusuf/Library/Application\ Support/Google'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias minikube_eval='eval $(minikube docker-env)'
alias docker_status="watch 'docker ps; echo; echo Container count: ; docker ps | egrep -v COMMAND | wc -l; echo; docker network ls'"
alias kb_token='kubectl -n kube-system describe secret `kubectl -n kube-system get secret|grep admin-token|cut -d " " -f1`|grep "token:"|tr -s " "|cut -d " " -f2'
alias l='ls -lF'
alias la='ls -alF'
alias lo=logout
alias ls='ls -F'
alias lad='ssh mradamy@laptopAdam'
alias m='less -a -i -P='
alias mr='ssh stack@192.168.56.101'
alias me='ssh stack@172.15.0.204'
alias ip='curl ifconfig.co'
alias ip='curl ifconfig.me'
alias o='ssh -t myusuf@obscure01.netflix.com "sudo su - "'
#alias ping='/usr/bin/ping'
alias clk='xclock -digital -fg white -bg forestgreen -update 1&'
alias iphone='ssh mobile@192.168.1.10'
alias vb_tailvm='tail -f /home/myusuf/VirtualBox\ VMs/avayatest/Logs/VBox.log'
alias vb_com='VBoxManage | grep "VBoxManage "|more'
alias vbm='VBoxManage'
alias outlook='cd /home/myusuf/AppData/Local/Microsoft/Outlook'
alias hn='reboot -h now'
alias kalw='/cygdrive/c/Program\ Files/Windows\ Media\ Player/wmplayer.exe http://www.kalw.org/media/Streaming%20Links/kalw_wmestream.asx &'
alias kpfa='/cygdrive/c/Program\ Files/Windows\ Media\ Player/wmplayer.exe http://www.kpfa.org/streams/kpfa_64k.m3u &'
alias kqed='/cygdrive/c/Program\ Files/Windows\ Media\ Player/wmplayer.exe http://www.kqed.org/radio/listen/kqedradio.m3u &'
alias clearIE='rm -r /cygdrive/c/Users/myusuf/AppData/Local/Microsoft/Windows/Temporary\ Internet\ Files/*'
alias tp='cd /cygdrive/c/Users/myusuf/AppData/Roaming/Thunderbird/Profiles/ztxxmpbt.eMarketing/ImapMail'
alias vhmc='ssh -L localhost:443:vaulthmc100.netflix.com:443 -L localhost:9960:vaulthmc100.netflix.com:9960 vaultgate101'
alias vhmc='ssh -L localhost:443:vaulthmc100.netflix.com:443 -L localhost:9960:vaulthmc100.netflix.com:9960 -L localhost:222:vaulthmc100.netflix.com:22 vaultgate101'
alias bkup='bash -x /cygdrive/c/Users/myusuf/home/work/archive/cmd-archive.sh'
alias gp='/Users/myusuf/Downloads/geppetto/Geppetto.app/Contents/MacOS/Geppetto &'

#alias weather='telnet vicbeta.vic.bom.gov.au 55555'
alias which='type -all'
alias xman='xman -bothshown -notopbox &'
alias pm='ssh -l root puppetmaster'
#alias myip='ipconfig.exe /all | grep IPv4'
alias myip="ifconfig en0 | awk '/broad/'"
# 	inet 10.8.176.96 netmask 0xfffffe00 broadcast 10.8.177.255
#
alias phantomjs='~/Downloads/phantomjs-2.1.1-macosx/bin/phantomjs'


#########################################################
# Some windows aliases
#########################################################
alias win_w='net statistics server | grep "since"'
alias win_w_all='net statistics server '

#########################################################
# Setup ssh-agent
#########################################################
#alias lvm='ssh root@10.0.0.92'
alias lvm='ssh root@learning.hsd1.ca.comcast.net'


#########################################################
# functions
#########################################################

# A new version of "cd" which
# prints the directory after cd'ing
#cd() {
#	builtin cd $1
#	pwd
#}


# add the directoried specified to the path file
# and re-read it.
pathadd() {
	for p in $*
	do
		echo $p >> ~/.path
	done
	export PATH=`colonise ~/.path`
}

################################################
# Ping the gateway
pg(){
   while :
   do
       # ping -c 100 8.8.8.8 > out 2>&1 &
       >/tmp/out 2>&1

       DATE=`date "+%Y-%m-%d%"`
       GATEWAY=`netstat -rn | awk '/default/ {print $2}'`
       STARTTIME=`date "+%H:%M:%S"`
       echo "ping -c $COUNT $GATEWAY"
read
       ping -c $COUNT $GATEWAY | tee /tmp/out
       ENDTIME=`date "+%H:%M:%S"`
       echo $DATE: TimeRange: $STARTTIME - $ENDTIME 
       sleep 5
       echo
   done
}

################################################
# lookup stuff on ss
lg(){

   grep -i $* /home/myusuf/home/work/ss
}

# lookup stuff on ss
str(){

StringToLookFor=$1
WhereToLook=$2

echo StringToLookFor: $StringToLookFor
echo WhereToLook: $WhereToLook


   for i in `find $WhereToLook`
   do
       if [ -d $i ]; then
           echo $i: skipping directory
       else
           #echo $i: not a directory
           egrep $StringToLookFor $i
       fi
   done
}


# added for npm-completion https://github.com/Jephuff/npm-bash-completion
#PATH_TO_NPM_COMPLETION="/Users/myusuf/work/npm-work/npm-completion"
#source $PATH_TO_NPM_COMPLETION/npm-completion.sh
