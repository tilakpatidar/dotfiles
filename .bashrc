cowsay containers are awesome

# Set SSH agent
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
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_141.jdk/Contents/Home
export PATH=~/bin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"
export SCALA_HOME=~/bin/scala
export PATH=$SCALA_HOME/bin:$PATH
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export GRADLE_HOME=/usr/local/Cellar/gradle/4.0.1/libexec/
#eval "$(rbenv init -)"
export PYTHON_PATH="${PYTHON_PATH}:/Library/Python/2.7/site-packages"
export PYTHONSTARTUP=$HOME/.pythonstartup

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
#add go lang path
export PATH=/usr/local/opt/go/libexec/bin:$PATH
export GOPATH=$HOME/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export LANG=en_US.UTF-8
#Add macvim binaries to PATH
export PATH=$PATH:/Applications/MacVim.app/Contents/bin
export HADOOP_HOME=/usr/local/Cellar/hadoop/2.8.0
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin
#replace vi with vim8
alias vi="vim"
export EDITOR="/usr/local/bin/vim"
