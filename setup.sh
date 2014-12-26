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

for dot in "${dots[@]}"
do
  ln -sf dotfiles/$dot $dot
done

echo "» In $PWD"

for copy in "${copies[@]}"
do
  if [ -f $copy ]; then
    echo "» Saving $copy as $copy.bak"
    cp $copy $copy.bak
  fi
done

# Copy files to ~/. Prompt for overwriting.
echo
cp -Ri dotfiles/copy/. .

echo
while true; do
    read -p "Edit .gitconfig credentials? y/n : " yn
    case $yn in
        [Yy]* ) "${EDITOR:-vi}" .gitconfig; break;;
        [Nn]* ) break;;
        * ) echo "Please answer y or n.";;
    esac
done