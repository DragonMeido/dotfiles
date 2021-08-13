if status is-interactive
    # Commands to run in interactive sessions can go here
end

if [ -f $HOME/.config/fish/aliases.fish ]
    source $HOME/.config/fish/aliases.fish
end

# repaint screen on screen resize
function __fish_winch_handler --on-signal winch
	commandline -f repaint
end

export EDITOR="nvim"

