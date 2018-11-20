set -U LANG "en_US.UTF-8"
set -U JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home"
set -U PYTHON_PATH "$PYTHON_PATH:/Library/Python/2.7/site-packages"
set -U EDITOR "/usr/local/bin/nvim"
set -U fish_user_paths "/usr/local/bin" "/Applications/calibre.app/Contents/MacOS" "~/bin" "/usr/local/bin" "/usr/local/sbin" "/Applications/MacVim.app/Contents/bin" "/usr/local/opt/icu4c/bin" "/usr/local/opt/icu4c/sbin" $fish_user_paths
set -U DEV_MACHINE_IP "10.129.84.195"
set -U NOKIA_HOME "$HOME/git_repos/nokia"
set -U SSH_ENV "$HOME/.ssh/environment"
set -e http_proxy
set -e https_proxy

# Set proxy if using nokia LAN or WiFi
ifconfig en4 2> /dev/null | grep -q -o RUNNING; and setProx
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}' | grep -q "NOSI"; and setProx

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