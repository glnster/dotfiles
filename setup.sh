#!/bin/bash
# rm and create symlinks
cd $HOME

# separated by space/newline, NOT commas
dots=('.aliases'
      '.bash_profile'
      '.bash_prompt'
      '.exports'
      '.functions'
      '.vim'
      '.vimrc'
      '.vimrc.bundles'
      '.zshrc'
      );

for dot in "${dots[@]}"
do
  rm $dot
  ln -s dotfiles/$dot $dot
done

