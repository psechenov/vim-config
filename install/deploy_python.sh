sudo pip install flake8

mkdir -p ~/.config
cp ~/.vim/.config/flake8 ~/.config

ln -sf ~/.vim/vimrc.d/avail.d/common.vim ~/.vim/vimrc.d/conf.d/common.vim
ln -sf ~/.vim/vimrc.d/avail.d/python.vim ~/.vim/vimrc.d/conf.d/python.vim

./deploy.sh
