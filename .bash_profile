# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export PATH

set -o vi
bind -m vi-command ".":yank-last-arg
bind -m vi-insert "\C-l.":clear-screen
bind -m vi-insert "\C-a.":beginning-of-line
bind -m vi-insert "\C-e.":end-of-line
bind -m vi-insert "\C-w.":backward-kill-word
bind -m vi-insert "\C-d.":kill-word
bind -m vi-insert "\C-p.":history-search-backward
bind -m vi-insert "\C-n.":history-search-forward
bind -m vi-insert "\C-b.":backward-char
bind -m vi-insert "\C-f.":forward-char
bind -m vi-insert "\C-h.":backward-word
bind -m vi-insert "\C-j.":forward-word
bind -m vi-insert "\C-k.":kill-line
bind -m vi-insert "\C-u.":backward-kill-line
bind -m vi-insert "\C-y.":yank
bind -m vi-insert "\C-r.":reverse-search-history
