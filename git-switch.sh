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
    reap -p "Enter your Github Account Email": github_set_account_email
    git config user.name "$github_set_account_name"
    git config user.email "$github_set_account_email"
}

function github_account_switch() {
    # Github Account Switch (2 Accounts)
    echo "Choose an option:"
    echo "Switch to Account 1"
    echo "Switch to Account 2"
    read choice

    #sudo chown philip:philip -R  ~/.ssh
    #chmod 700  ~/.ssh/
    #chmod 600  ~/.ssh/id_ed25519.pub
    #chmod 600  ~/.ssh/id_ed25519

    case $choice in
    1)
        echo "Github Account #1 Selected."
        gitHubAccount1 = "%userprofile%\.ssh\id_ed25519_account1"
        gitHubAccount1_pub = "%userprofile%\.ssh\id_ed25519_account1.pub"
        newFileName1 = "id_ed25519"
        newFileName1_pub = "id_ed25519.pub"
        mv $gitHubAccount1 $newFileName1
        mv $gitHubAccount1_pub $newFileName1_pub
        ;;
    2)
        echo "Github Account #2 Selected."
        echo "Github Account #1 Selected."
        gitHubAccount2 = "%userprofile%\.ssh\id_ed25519"
        gitHubAccount2_pub = "%userprofile%\.ssh\id_ed25519.pub"
        newFileName2 = "id_ed25519_account1"
        newFileName2_pub = "id_ed25519_account1.pub"
        mv $gitHubAccount2 $newFileName2
        mv $gitHubAccount2_pub $newFileName2_pub
        ;;
    *)
        echo "Invalid choice. Please select 1 or 2."
        ;;
esac
}

echo "Choose an option:"
echo "1. Switch GitHub Account"
echo "2. Generate SSH Key"
echo "3. Test Github SSH connection"
echo "4. Set Github account"
read option

case $option in
    1)
        github_account_switch
        ;;
    2)  
        github_generate_sshkey
        ;;
    3)
        github_connection_test
        ;;
    4)
        github_set_account
        ;;
    *)
        echo "Invalid option"
        ;;
esac