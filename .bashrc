# (cowsay containers are awesome &)
# Andriod
#export ANDROID_HOME="$HOME/Library/Android/sdk"
#export PATH=${PATH}:${ANDROID_HOME}/emulator
#export PATH=~/Library/Android/sdk/tools:$PATH
#export PATH=~/Library/Android/sdk/platform-tools:$PATH
#export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
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

export PATH=/usr/local/mysql/bin:/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH
export PATH=/usr/local/Cellar/httrack/3.49.2/bin/:/Applications/calibre.app/Contents/MacOS/:$PATH
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export SCALA_HOME=~/bin/scala
export PATH=$SCALA_HOME/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GRADLE_HOME=/usr/local/Cellar/gradle/4.0.1/libexec/
export PYTHON_PATH="${PYTHON_PATH}:/Library/Python/2.7/site-packages"
export PYTHONSTARTUP=$HOME/.pythonstartup

# GO PATH
#export PATH=/usr/local/opt/go/libexec/bin:$PATH
#export GOPATH=$HOME/go-workspace
#export GOROOT=/usr/local/opt/go/libexec
#export GOBIN=$GOPATH/bin
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin

export LANG=en_US.UTF-8

# Add macvim binaries to PATH
export PATH=$PATH:/Applications/MacVim.app/Contents/bin

# HADOOP
export HADOOP_HOME=/usr/local/Cellar/hadoop/2.8.0/libexec
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#export HIVE_HOME=/usr/local/Cellar/hive/2.3.1/libexec
#export HCAT_HOME=/usr/local/opt/hive/libexec/hcatalog
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.2.0/libexec
#export LIVY_HOME=/Users/tilak/bin/livy
# Replace vi with vim8
alias vi="nvim"

# Set default editor
export EDITOR="/usr/local/bin/nvim"

# Haskell
# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
# export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
# if [ -d "$GHC_DOT_APP" ]; then
  # export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
# fi
export PATH="/usr/local/opt/libxml2/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="~/git_repos/gobblin-fork/gobblin-dist/bin:$PATH"
export DATAIKU_RESOURCES="/Applications/DataScienceStudio.app/Contents/Resources/kit"
export DATAIKU_HOME="$HOME/Library/DataScienceStudio/dss_home/"
export PATH="$PATH:/Users/tilak/Library/Python/2.7/bin"
ls -a | grep -w -q ".env" && source .env
ls -a | grep -w -q ".env_ex_" && source .env_ex_


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
  source ~/.post_autojump
}
