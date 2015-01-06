#!/bin/bash

reset=$'\e[0m'
orange=$'\e[38;5;202m'
white=$'\e[1;37m'
blue=$'\e[38;5;26m'

cd $HOME

echo
echo "${blue}» In ${white}$PWD ${blue}making symlinks...${reset}"

# separated by space/newline, NOT commas
dots=( ### .gitconfig will copied from local to home
      '.gitignore_global'
      );
shells=('aliases'
      'bash_profile'
      'bash_prompt'
      'bashrc'
      'exports'
      'functions'
      );
zshs=('zpreztorc'
      'zprofile'
      'zshenv'
      'zshrc'
      );
vims=('vimrc'
      'vimrc.bundles'
      );
locals=('.extra'
        '.gitconfig'
        );

# Make symlinks to dotfiles
for dot in "${dots[@]}"
do
  ln -sfv dotfiles/$dot $dot
done

# Make symlinks to shell files
for shell in "${shells[@]}"
do
  ln -sfv dotfiles/shell/$shell .$shell
done

# Make symlinks to vim files
for vim in "${vims[@]}"
do
  ln -sfv dotfiles/.vim/$vim .$vim
done

# symlink for .vim dir
ln -sfv dotfiles/.vim .vim

# Make symlinks to Zsh/Prezto files
getZsh=true;
while $getZsh; do
  echo
  read -p "${orange}Do you want to symlink Zsh dotfiles? y/n: ${reset}" yn
  case $yn in
      [Yy]* )
          for zsh in "${zshs[@]}"
          do
            ln -sfv dotfiles/shell/$zsh .$zsh
          done
          getZsh=true;
          ;;
      [Nn]* ) 
        echo "Ok, skipping Zsh symlinking.";
        getZsh=false;
        ;;
      * ) echo "Please answer y or n.";;
  esac
done

echo
echo "${blue}» In ${white}$PWD${reset}"

# Make backups of locals files
for local in "${locals[@]}"
do
  if [ -f $local ]; then
    echo "${blue}» Saved your current ${white}~/$local ${blue}to ${white}~/dotfiles/local/$local.bak${reset}"
    cp $local dotfiles/local/$local.bak
  fi
done

localsStr="";
for local in "${locals[@]}"
do
  localsStr+="$local "
done

echo "${blue}» Now to copy templates ${white}$localsStr${blue}to ${white}. ($PWD)${reset}"
echo "${orange}Is it OK to...${reset}"

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