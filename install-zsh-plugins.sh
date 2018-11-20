git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc


cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
git clone https://github.com/djui/alias-tips.git

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

curl -L https://iterm2.com/shell_integration/zsh \
-o ~/.iterm2_shell_integration.zsh

cd ~
git clone https://github.com/olivierverdier/zsh-git-prompt.git

defaults write com.googlecode.iterm2 MaxPasteHistoryEntries -int 100
defaults write com.googlecode.iterm2 QuickPasteBytesPerCall -int 1000000
defaults write com.googlecode.iterm2 QuickPasteDelayBetweenCalls -float 0.01
defaults write com.googlecode.iterm2.plist SmartCursorColorBgThreshold -float 0.5
defaults write com.googlecode.iterm2.plist SmartCursorColorFgThreshold -float 0.75
touch ~/.hushlogin
