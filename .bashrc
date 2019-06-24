#export JEPSEN_ROOT=/Users/tilak/git_repos/jepsen/

# SSH agent
if ! pgrep -x "ssh-agent" > /dev/null; then
  echo "[INFO] SSH agent not running, restarting"
  eval `ssh-agent -s`
  ssh-add -k ~/.ssh/id_rsa
fi
export GPG_TTY=$(tty)
source ~/.ssh-find-agent/ssh-find-agent.sh
set_ssh_agent_socket

# Postgres and Mysql Paths
# export PATH=/usr/local/mysql/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=/Applications/calibre.app/Contents/MacOS:~/bin:$PATH
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GRADLE_HOME=/usr/local/Cellar/gradle/4.0.1/libexec/
export PYTHON_PATH="${PYTHON_PATH}:/Library/Python/2.7/site-packages"
export PYTHONSTARTUP=$HOME/.pythonstartup

export LANG=en_US.UTF-8

# Add macvim binaries to PATH
export PATH=$PATH:/Applications/MacVim.app/Contents/bin

# Replace vi with vim8
alias vi="nvim"

# Set default editor
export EDITOR="/usr/local/bin/nvim"

export PATH="/usr/local/opt/libxml2/bin:/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin:$HOME/.cargo/bin:$PATH"
export PATH="~/git_repos/gobblin-fork/gobblin-dist/bin:$PATH"
export PATH="$PATH:/Users/tilak/Library/Python/2.7/bin"

# Set nokia proxy when using nokia network
unset http_proxy
unset https_proxy
ifconfig | grep -o en4\.\* | head -n 1 | grep -q -o RUNNING && export https_proxy=http://10.158.100.1:8080 && export http_proxy=http://10.158.100.1:8080

# Redeclare autojump for post autojump hooks

j () {
	if [[ ${1} = -* ]] && [[ ${1} != "--" ]]
	then
		autojump ${@}
		return
	fi
	setopt localoptions noautonamedirs
	local output="$(autojump ${@})"
	if [[ -d "${output}" ]]
	then
		if [ -t 1 ]
		then
			echo -e "\\033[31m${output}\\033[0m"
		else
			echo -e "${output}"
		fi
		cd "${output}"
	else
		echo "autojump: directory '${@}' not found"
		echo "\n${output}\n"
		echo "Try \`autojump --help\` for more information."
		false
	fi
  source ~/.zshrc	
}

function fp() {
	if (pgrep osascript /Users/tilak/bin/AutoLaunch.scpt) then
	  echo "Floating prompt is running. Switching it off."
	  kill -9 $FLOATING_PROMPT_PID
	else
	  echo "Floating prompt is not running. Switching it on."
      (osascript ~/bin/AutoLaunch.scpt) &
      sleep 2
      export FLOATING_PROMPT_PID=$(pgrep osascript /Users/tilak/bin/AutoLaunch.scpt)
	fi
}

function fps() {
	if (pgrep osascript /Users/tilak/bin/AutoLaunch.scpt) then
	  echo "Floating prompt is running."
	else
	  echo "Floating prompt is not running"
	fi
}

source /usr/local/bin/activate.sh
source /usr/local/bin/activate.sh
source /Users/tilak/git_repos/mopar/data-management/env/bin/activate.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# >>> talisman >>>
# Below environment variables should not be modified unless you know what you are doing
export TALISMAN_HOME=/Users/tilak/.talisman/bin
alias talisman=$TALISMAN_HOME/talisman_darwin_amd64
# <<< talisman <<<
