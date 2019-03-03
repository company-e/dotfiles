DOT_FILES=(.bashrc .vimrc)

for file in ${DOT_FILES[@]}
do
	ln -snfv $HOME/dotfiles/$file $HOME/$file
done

