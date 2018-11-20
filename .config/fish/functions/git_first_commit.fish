function git_first_commit
	git log --oneline --decorate --color | head -n 1 | cut -d \" \" -f1
end
