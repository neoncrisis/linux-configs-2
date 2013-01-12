## If not running interactively, don't do anything
[[ $- != *i* ]] && return

##-------------------------------------------------------------
## Some Settings
##-------------------------------------------------------------

## Bash
shopt -s checkhash			# bash will check hash table for command before searching path
shopt -s checkwinsize		# update window size after each command

## CD
shopt -s autocd             # Automatically cd when a bare path is typed
shopt -s cdspell  			# Correct errors in directory names when using CD
shopt -s cdable_vars		# Enable cd to use variable expansion
shopt -s dirspell			# spelling correction on directory names during word completion

## HISTORY
HISTCONTROL=ignoredups:ignorespace  	# don't put duplicate lines in the history.
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend			# append to the history file, don't overwrite it
#shopt -s cmdhist			# save all lines of a multi-line command in the same history entry. (Default set)

## Expansion
shopt -s dotglob			# include filenames beginning with a `.' in the results of filename expansion.
#shopt -s expand_aliases		# allow expansion of bash aliases (Default set)
shopt -s extglob			# required for programable expansion (Default set)
shopt -s no_empty_cmd_completion	# do not attempt to auto complete empty command line
#shopt -s nocaseglob			# match as case insensitive when expanding file names
#shopt -s nocasematch			# matches patterns as case-insensitive matching while executing case or [[ conditional commands.

## Mail
#shopt -u mailwarn
#unset MAILCHECK

##-------------------------------------------------------------
## Greeting, motd etc...
##-------------------------------------------------------------

## First define some color variables
black="\[\033[0;38;5;0m\]"
nocol="\[\033[00m\]"
red="\[\033[0;38;5;1m\]"
orange="\[\033[0;38;5;130m\]"
green="\[\033[0;38;5;2m\]"
yellow="\[\033[0;38;5;3m\]"
blue="\[\033[0;38;5;4m\]"
bblue="\[\033[0;38;5;12m\]"
magenta="\[\033[0;38;5;55m\]"
cyan="\[\033[0;38;5;6m\]"
white="\[\033[0;38;5;7m\]"
coldblue="\[\033[0;38;5;33m\]"
smoothblue="\[\033[0;38;5;111m\]"
iceblue="\[\033[0;38;5;45m\]"
turqoise="\[\033[0;38;5;50m\]"
smoothgreen="\[\033[0;38;5;42m\]"

##-------------------------------------------------------------
## Shell Prompt
##-------------------------------------------------------------

function pre_prompt {
    newPWD="${PWD}"
    user=$(whoami)
    host=$(echo -n $HOSTNAME | sed -e "s/[\.].*//")

    let promptsize=$(echo -n "┌─[ $newPWD ]──[ $user@$host ]─┐" | wc -m | tr -d " ")
    let fillsize=${COLUMNS}-${promptsize}
    fill=""
    while [ "$fillsize" -gt "0" ]
    do
        fill="${fill}─"
        let fillsize=${fillsize}-1
    done
    if [ "$fillsize" -lt "0" ]
    then
        let cutt=3-${fillsize}
        newPWD="...$(echo -n $PWD | sed -e "s/\(^.\{$cutt\}\)\(.*\)/\2/")"
    fi
}

# run pre_prompt before the bash prompt is created
PROMPT_COMMAND=pre_prompt


case "$TERM" in
xterm)
    PS1="\n$bblue┌─( $white\${newPWD} $bblue)─\${fill}─( $white\${user}@\${host} $bblue)─┐\n$bblue└─[ $white\$(date \"+%r\") $bblue]─>$nocol "
    ;;
    *)
    PS1="\n┌─( \${newPWD} )─\${fill}─( \${user}@\${host} )─┐\n└─[ \$(date \"+%r\") ]─> "
    ;;
esac

##-------------------------------------------------------------
## Helpers
##-------------------------------------------------------------

## Source ~/.bash_aliases
if [ -r ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

## Source ~/.bash_functions
if [ -r ~/.bash_functions ]; then
    . ~/.bash_functions
fi

## Source ~/.bash_environment
if [ -r ~/.bash_environment ]; then
    . ~/.bash_environment
fi

# Enable programmable completion features.
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Make less cooler
if [[ -r $(which lesspipe.sh) ]]; then
    LESSOPEN="|/usr/bin/lesspipe.sh %s"
    LESS="-R"
    export LESSOPEN
    export LESS
fi

## color support of ls and grep
if [ -x $(which dircolors) ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
