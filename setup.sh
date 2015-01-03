#!/bin/bash
# rm and create symlinks
cd $HOME

echo
echo "» In $PWD making symlinks"

# separated by space/newline, NOT commas
shells=('aliases'
      'bash_profile'
      'bash_prompt'
      'bashrc'
      'exports'
      'functions'
      'zpreztorc'
      'zprofile'
      'zshenv'
      'zshrc'
      );
vims=('vimrc'
      'vimrc.bundles'
      );
dots=( ### .gitconfig will copied from local to home
      '.gitignore_global'
      );

locals=('.extra'
        '.gitconfig'
        );

# Make symlinks to dotfiles
for dot in "${dots[@]}"
do
  ln -sf dotfiles/$dot $dot
done
for shell in "${shells[@]}"
do
  ln -sf dotfiles/shell/$shell .$shell
done
for vim in "${vims[@]}"
do
  ln -sf dotfiles/.vim/$vim .$vim
done
# symlink for .vim dir
ln -sf dotfiles/.vim .vim

echo
echo "» In $PWD"

# Make backups of locals files
for local in "${locals[@]}"
do
  if [ -f $local ]; then
    echo "» Saving $local as ~/dotfiles/local/$local.bak"
    cp $local dotfiles/local/$local.bak
  fi
done

echo

# Copy the locals files to ~/. Prompt for overwriting.
for local in "${locals[@]}"
do
  if [ -f $local ]; then
    cp -Ri dotfiles/local/$local .
  else
    cp dotfiles/local/$local .
  fi
done

# Run .gitconfig setup
./dotfiles/setupgit.sh