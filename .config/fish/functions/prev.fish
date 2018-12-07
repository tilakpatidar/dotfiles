function prev
	commandline -t $history[$argv[1]]; commandline -f repaint
end
