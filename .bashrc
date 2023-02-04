# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.

# export
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}
function proxy(){
    export HTTP_PROXY=http://127.0.0.1:7890
    export HTTPS_PROXY=https://127.0.0.1:7890
    export ALL_PROXY=http://127.0.0.1:7890
}
function no_proxy(){
    export HTTP_PROXY=
    export HTTPS_PROXY=
    export ALL_PROXY=
}

export NVM_NODEJS_ORG_MIRROR=https://npm.taobao.org/mirrors/node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#alias
alias vim="vi"
alias ll="ls -l"
alias r="ranger"
alias wifis='iwctl station wlan0 scan && iwctl station wlan0 get-networks'
alias wifi="iwctl station wlan0 connect $1"


# path
export JAVA_HOME=/opt/jdk
export JRE_HOME=/opt/jdk/jre
export CLASS_PATH=$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin$PATH
export PS1='\[\e[35;1m\]\u\[\e[31;1m\]@\[\e[35;1m\]\h\[\e[34;32m\] \w\[\e[33;32m\]$(git_branch) \[\e[31;1m\]  \[\e[36;1m\]'
