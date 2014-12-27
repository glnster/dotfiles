#!/bin/bash
# rm and create symlinks

reset=$'\e[0m'
orange=$'\e[38;5;202m'
white=$'\e[1;37m'
blue=$'\e[38;5;26m'

cd $HOME

echo
echo "${blue}Loading new .gitconfig...${reset}"
git config -l
echo
echo "${blue}Loaded .gitconfig above${reset}"


# Create .gitconfig.local file based on user input
echo
echo "${blue}Customize your .gitconfig...${reset}"
getName=true;
while $getName; do
    echo
    read -p "${orange}Please enter your full Git name: ${reset}" gitname
    read -p "${orange}Is ${white}$gitname ${orange}correct? y/n: ${reset}" yn
    case $yn in
        [Yy]* ) getName=false; break;;
        [Nn]* ) getName=true;;
        * ) echo "Please answer y or n.";;
    esac
done

getEmail=true;
while $getEmail; do
    echo
    read -p "${orange}Please enter your Git email: ${reset}" gitemail
    read -p "${orange}Is ${white}$gitemail ${orange}correct? y/n: ${reset}" yn
    case $yn in
        [Yy]* ) getEmail=false; break;;
        [Nn]* ) getEmail=true;;
        * ) echo "Please answer y or n.";;
    esac
done

getPush=true;
while $getPush; do
    echo
    echo "${orange}Select a default push for your Git. Older Git versions use 'matching'.${reset}"
    PS3="${orange}Please enter your choice: ${reset}"
    select gitpush in "simple" "matching"; do
        case $gitpush in
            simple ) gitpush=$gitpush; break;;
            matching ) gitpush=$gitpush; break;;
        esac
    done

    read -p "${orange}Is ${white}$gitpush ${orange}correct? y/n: ${reset}" yn
    case $yn in
        [Yy]* ) getPush=false; break;;
        [Nn]* ) getPush=true;;
        * ) echo "Please answer y or n.";;
    esac
done

# Output to .gitconfig.local file
# echo "# A local file that gets sourced to config your .gitconfig
# git config --global user.name \"$gitname\"
# git config --global user.email \"$gitemail\"
# git config --global push.default \"$gitpush\"" > .gitconfig.local

git config --global --replace-all user.name "$gitname"
git config --global --replace-all user.email "$gitemail"
git config --global --replace-all push.default "$gitpush"

echo
echo "${blue}.gitconfig setup done. Run git config to verify. And you might want to reload your shell too.${reset}"