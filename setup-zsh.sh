#!/usr/bin/env bash
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Installing zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
    curl -Lo ~/convert_bash_to_zsh.sh https://gist.github.com/muendelezaji/c14722ab66b505a49861b8a74e52b274/raw/49f0fb7f661bdf794742257f58950d209dd6cb62/bash-to-zsh-hist.py
    chmod +x ~/bash-to-zsh-hist.py
    echo "Converting bash history"
    cat ~/.bash_history | bash-to-zsh-hist.py >> ~/.zsh_history
    source ~/.zshrc
fi

if [ ! -f "$HOME/.oh-my-zsh/antigen.zsh" ]; then
    curl -L git.io/antigen > ~/.oh-my-zsh/antigen.zsh
    source ~/.oh-my-zsh/antigen.zsh
fi


grep 'alias config' $HOME/.zshrc || echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> ~/.zshrc


