function cpa
	commandline -t (cat ~/.config/fish/functions/$argv.fish | head -n 2 | tail -n 1); commandline -f repaint
end
