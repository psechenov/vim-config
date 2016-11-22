sudo apt-get install ctags cmake

cp ~/.vim/.indexer_files ~
echo "runtime vimrc" > ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
