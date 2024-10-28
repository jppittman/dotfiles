export PATH="$HOME/.local/bin:${PATH}"
export HOMEBREW_NO_UPDATE_CLEANUP=1
brewprefix=/usr/local/brew
export PATH="$brewprefix/bin:$brewprefix/sbin:$PATH"
export MANPATH="$brewprefix/share/man:$MANPATH"
unset brewprefix

