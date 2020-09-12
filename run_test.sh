docker build . -t dotfiles_test_container && \
docker run -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 -e TERM=$TERM --rm -v $(pwd):/dotfiles -w /dotfiles dotfiles_test_container /dotfiles/setup-zsh.sh
