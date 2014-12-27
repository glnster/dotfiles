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
      #'.gitconfig'  setup as local config file with credentials/settings
      '.gitignore_global'
      '.vim'
      '.vimrc'
      '.vimrc.bundles'
      '.zshrc'
      );

copies=('.extra'
        '.gitconfig'
        );

# Make symlinks to dotfiles
for dot in "${dots[@]}"
do
  ln -sf dotfiles/$dot $dot
done

echo "» In $PWD"

# Make backups of copy files
for copy in "${copies[@]}"
do
  if [ -f $copy ]; then
    echo "» Saving $copy as ~/dotfiles/copy/$copy.bak"
    cp $copy dotfiles/copy/$copy.bak
  fi
done

echo

# Copy the copy files to ~/. Prompt for overwriting.
for copy in "${copies[@]}"
do
  if [ -f $copy ]; then
    cp -Ri dotfiles/copy/$copy .
  else
    cp dotfiles/copy/$copy .
  fi
done

# Run .gitconfig setup
./dotfiles/setupgit.sh