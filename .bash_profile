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

ts() {
    date +'%Y-%m-%d %H:%M:%S' -d @$1 
}

starttmux() {
    HOSTS=${HOSTS:=$*}
    if [ -z "$HOSTS" ]; then
       echo -n "Please provide of list of hosts separated by spaces [ENTER]: "
       read HOSTS
    fi

    local hosts=( $HOSTS )
    local target="ssh-multi ${host[0]}"


    tmux new-window -n "${target}" ssh ${hosts[0]}
    unset hosts[0];
    for i in "${hosts[@]}"; do
        tmux split-window -t :"${target}" -h  "ssh $i"
        tmux select-layout -t :"${target}" tiled > /dev/null
    done
    tmux select-pane -t 0
    tmux set-window-option -t :"${target}"  synchronize-panes on > /dev/null

}
