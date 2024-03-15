#!/usr/bin/env bash
# Author
author="Philip Mello <@Microsoft>"
# Version
version="1.0"
# License
license="MIT"
# Date
current_date=$(date +'%b %d, %Y')
# GitHub
github='https://github.com/PhilipMello/scripts/'
github2='https://github.com/AtomyCloud/scripts/'
# Microsoft Official Documentation
microsoft=''
echo "
# --------------------------------------------------------------
# Script     : Git Account Switch
# Description: 2 Github Accounts in one CLI
# Version    : $version
# Date       : $current_date
# Author     : $author
# License    : $license
# Github     : $github
# Github     : $github2
# Microsoft  : $microsoft
# --------------------------------------------------------------
# How to use: Execute ./git-switch
# Exemples:
# Manual: ./git-switch -h OR ./git-switch--h OR ./git-switch --help
# --------------------------------------------------------------
"
WHITE=""
BLUE="\033[97;104m"
YELLOW="\033[97;103m"
CYAN="\033[97;106m"
MAGENTA="\033[97;45m"
GREEN="\033[97;102m"
RED="\033[97;41m"
ENDCOLOR="\e[0m"

function github_generate_sshkey() {
    # Generate SSH Key
    reap -p "Type your github email account": github_email_account
    ssh-keygen -t ed25519 -C "$github_email_account"
    echo "SSH key successfuly generated"
    cat ~/.ssh/id_ed25519.pub
    echo "Go to your GitHub Portal and add your SSH Key
    'https://github.com/settings/ssh/new'
    "
}

function github_connection_test() {
    # Github test connection
    echo "Github connection testing..."
    ssh -T git@github.com
}

function github_set_account() {
    # Github set account
    reap -p "Enter your Github Account Name": github_set_account_name
    reap -p "Enter your Github Account Name": github_set_account_email
    git config user.name "$github_set_account_name"
    git config user.email "$github_set_account_email"
}

echo "Choose an option:"
echo "1. Generate SSH Key"
echo "2. Test Github SSH connection"
echo "3. Set Github account"
read option

case $option in
    1)  
        github_generate_sshkey
        ;;
    2)
        github_connection_test
        ;;
    3)
        github_set_account
        ;;
    *)
        echo "Invalid option"
        ;;
esac