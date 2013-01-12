##-------------------------------------------------------------
## Useful functions
##-------------------------------------------------------------

function extract()      # Handy Extract Program.
{
	for ARCHIVE in "$@"; do
		if [ -f $ARCHIVE ] ; then
		 case $ARCHIVE in
				 *.tar.bz2)   tar xvjf $1   ;;
				 *.tar.gz)    tar xvzf $1   ;;
				 *.bz2)       bunzip2 $1    ;;
				 *.rar)       unrar x $1    ;;
				 *.gz)        gunzip $1     ;;
				 *.tar)       tar xvf $1    ;;
				 *.tbz2)      tar xvjf $1   ;;
				 *.tgz)       tar xvzf $1   ;;
				 *.zip)       unzip $1      ;;
				 *.Z)         uncompress $1 ;;
				 *.7z)        7z x $1       ;;
				 *)           echo "'$1' cannot be extracted via >extract<" ;;
		 esac
		else
		 echo "'$ARCHIVE' is not a valid file"
		fi
	done
}

## make directory and change to it.
function mkcd {
	mkdir -pv "$1"
	cd "$1"
}

## Open Files using xdg-open
function open () {
  for FILE in "$@"; do
		if [[ -f $FILE ]];then
			xdg-open "$FILE" &> /dev/null &
		fi
  done
}
