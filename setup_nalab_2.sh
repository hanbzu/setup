#!/bin/bash
# This is the script I use for a fresh install 
# of my own computer. It may or may not be suitable for you.
# --------------------------------------------
# CAUTION: In case you use this script make
# sure you understand the commands
# --------------------------------------------

MACHINE_TYPE=`uname -m`

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"


echo -e "$MSGCOL PROGRAMMING. R and R Studio. $ENDCOL"
source ~/setup/setup_dev_rstudio.sh


# Advice: git configuration
echo "Don't forget to configure git:"
echo "git config --global user.name \"John Doe\""
echo "$ git config --global user.email johndoe@example.com"
echo "More info here: http://git-scm.com/book/en/Customizing-Git-Git-Configuration"
echo "Also, don't forget to restart session if you want to use ZSH as default shell"

