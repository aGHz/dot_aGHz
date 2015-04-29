#!/bin/sh

mkdir -p `pwd`/bin

ln -s `pwd`/src/dot_aGHz/bash/bashrc.sh `pwd`/.bashrc
ln -s `pwd`/src/dot_aGHz/bash/bash_aliases.sh `pwd`/.bash_aliases
ln -s `pwd`/src/dot_aGHz/bash/bash_prompt.sh `pwd`/.bash_prompt

ln -s `pwd`/src/dot_aGHz/git/gitconfig `pwd`/.gitconfig
ln -s `pwd`/src/dot_aGHz/git/gitignore `pwd`/.gitignore_global
for gitscript in `pwd`/src/dot_aGHz/git/*.sh; do
    ln -s $gitscript `pwd`/bin/
done

ln -s `pwd`/src/dot_aGHz/vim/vimrc `pwd`/.vimrc
