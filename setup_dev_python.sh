#!/bin/bash
# Interactive python and python web scraping with scrapy

# Color messages
MSGCOL="\033[37;44m"
ENDCOL="\033[0m"

# PIP for Python packages
echo -e "$MSGCOL PIP and python-dev packages $ENDCOL"
sudo apt-get install -y python-pip python-dev

# Interactive
echo -e "$MSGCOL Ipython $ENDCOL"
sudo apt-get install -y ipython-notebook

# Webscraping with Scrapy
echo -e "$MSGCOL Scrapy $ENDCOL"
sudo pip install Scrapy
