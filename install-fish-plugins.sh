brew install fish
chsh -s /usr/local/bin/fish
which fish >> /etc/shells
ln -s ~/.alias.fish  ~/.config/fish/functions/aliases.fish
echo ". \"$HOME/.config/fish/functions/aliases.fish\"" >> cat ~/.config/fish/config.fish

curl -L https://get.oh-my.fish | fish
omf install cbjohnson
omf install https://github.com/jhillyerd/plugin-git
omf install brew
omf install sublime
omf install sudope
omf install pbcopy
omf install bang-bang

curl -L https://iterm2.com/shell_integration/fish \
-o ~/.iterm2_shell_integration.fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fisher add edc/bass
fisher add laughedelic/pisces
fisher add jethrokuan/fzf
fisher add tuvistavie/fish-ssh-agent


defaults write com.googlecode.iterm2 MaxPasteHistoryEntries -int 100
defaults write com.googlecode.iterm2 QuickPasteBytesPerCall -int 1000000
defaults write com.googlecode.iterm2 QuickPasteDelayBetweenCalls -float 0.01
defaults write com.googlecode.iterm2.plist SmartCursorColorBgThreshold -float 0.5
defaults write com.googlecode.iterm2.plist SmartCursorColorFgThreshold -float 0.75

curl --silent  https://raw.githubusercontent.com/thoughtworks/talisman/master/global_install_scripts/install.bash > /tmp/install_talisman.bash and; /bin/bash /tmp/install_talisman.bash pre-push
