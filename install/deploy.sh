sudo apt-get install ctags cmake python build-essential python-dev

cp ~/.vim/.indexer_files ~
echo "runtime vimrc" > ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
