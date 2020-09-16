#!/usr/bin/env bash

# If not running as root, use sudo
SUDO=""
if [ "$EUID" -ne 0 ]
then
  SUDO=sudo
fi
echo "Installing dependencies"
$SUDO apt-get update && $SUDO apt-get install -y zsh git curl autojump

convert_bash_hist() {
  curl -Lo ~/bash-to-zsh-hist.py https://gist.github.com/muendelezaji/c14722ab66b505a49861b8a74e52b274/raw/49f0fb7f661bdf794742257f58950d209dd6cb62/bash-to-zsh-hist.py
  chmod +x ~/bash-to-zsh-hist.py
  echo "Converting bash history"
  cat ~/.bash_history | bash-to-zsh-hist.py >> ~/.zsh_history
}

install_plugins() {
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
  #curl -Lo $HOME/Spaceship10kTheme http://bit.ly/Spaceship10kTheme
  echo "source ~/dotfiles/Spaceship10kTheme" >~/.zshrc
}


if [ ! -f "$HOME/.zshrc" ]
then
  #sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --skip-chsh
  #sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
  #cp ./zshrc ~/.zshrc
  #cp ./p10k.zsh ~/.p10k.zsh
  #chsh -s $(which zsh)
  #source ~/.zshrc
fi

install_plugins

grep 'alias config' $HOME/.zshrc || echo "alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> ~/.zshrc
exec zsh
