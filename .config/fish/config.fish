set -Ux LANG "en_US.UTF-8"
set -Ux JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
set -Ux PYTHON_PATH "$PYTHON_PATH:/Library/Python/2.7/site-packages"
set -Ux EDITOR "/usr/local/bin/nvim"
set -Ux fish_user_paths "/usr/local/bin" "/Applications/calibre.app/Contents/MacOS" "~/bin" "/usr/local/bin" "/usr/local/sbin" "/Applications/MacVim.app/Contents/bin" "/usr/local/opt/icu4c/bin" "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -Ux DEV_MACHINE_IP "10.129.84.195"
set -Ux NOKIA_HOME "$HOME/git_repos/nokia"
set -Ux SSH_ENV "$HOME/.ssh/environment"
changeProxy
# Start ssh-agent if not running and save pass-phrase the first time
source $SSH_ENV > /dev/null
if not ps -p $SSH_AGENT_PID > /dev/null
  echo "[INFO] SSH agent not running, restarting"
  ssh-agent -c > $SSH_ENV
  chmod 600 $SSH_ENV
  source $SSH_ENV > /dev/null
  ssh-add -k ~/.ssh/id_rsa
end

source ~/.iterm2_shell_integration.fish

eval (direnv hook fish)
