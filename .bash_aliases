## Intelligent Utilities ##
# ======================= #
alias sudo='sudo '  # Allow aliases using sudo
alias mkdir='mkdir -pv'
alias rm='rm --one-file-system -Iv'
alias cp='cp -iv'
alias mv='mv -iv'

## Power Aliases
#=================================
alias halt='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop'
alias reboot='dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart'
alias hibernate='dbus-send --system --print-reply --dest="org.freedesktop.UPower" /org/freedesktop/UPower org.freedesktop.UPower.Hibernate'
alias logout='openbox --exit'

