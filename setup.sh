#!/bin/bash
# rm and create symlinks
cd $HOME

# separated by space/newline, NOT commas
dots=('.aliases'
      '.bash_profile'
      '.bash_prompt'
      '.bashrc'
      '.exports'
      '.functions'
      '.vim'
      '.vimrc'
      '.vimrc.bundles'
      '.zshrc'
      '.gitconfig'
      '.gitignore_global'
      );

# TODO check if file exists in dotfiles before rm. Else alert and skip.

for dot in "${dots[@]}"
do
  rm $dot
  ln -s dotfiles/$dot $dot
done

