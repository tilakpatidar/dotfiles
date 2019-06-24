function gclone
	git clone $argv
cd (string replace ".git" "" (string split "/" $argv[-1])[-1])
end
