docker build . -t dotfiles_test_container && \
docker run -e LANG=C.UTF-8 -e LC_ALL=C.UTF-8 -e TERM=$TERM --rm -v $(pwd):/root/dotfiles -w /root/dotfiles dotfiles_test_container ./setup-env.sh
