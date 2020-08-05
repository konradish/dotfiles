#!/usr/bin/env bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
curl -Lo ~/convert_bash_to_zsh.sh https://gist.github.com/muendelezaji/c14722ab66b505a49861b8a74e52b274#file-bash-to-zsh-hist-py
chmod +x ~/convert_bash_to_zsh.sh
cat ~/.bash_history | python bash-to-zsh-hist.py >> ~/.zsh_history
#curl -L git.io/antigen > ~/.oh-my-zsh/antigen.zsh

source ~/.zshrc
