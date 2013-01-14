## Intelligent Utilities ##
# ======================= #
alias sudo='sudo '  # Allow aliases using sudo
alias mkdir='mkdir -pv'
alias rm='rm --one-file-system -Iv'
alias mv='mv -i'
alias cp='cp -iv'
alias mv='mv -iv'
alias ping='ping -c 4'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

## Power Aliases
#=================================
alias halt='systemctl halt'
alias reboot='systemctl reboot'
alias hibernate='dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate'
alias logout='openbox --exit'

