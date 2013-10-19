#!/bin/bash
# Installs R together with R studio for a Ubuntu machine
# More information
# Here: http://cran.rstudio.com/bin/linux/ubuntu/README.html
# And here: http://www.rstudio.com/ide/download/desktop

RSTUDIO_VERSION="rstudio-0.97.551-amd64"
read -p "We're going to install Rstudio $RSTUDIO_VERSION. Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # ****** OK, we're ready for more dangerous stuff ******

  # First, we need to install R
  if grep -q "cran" /etc/apt/sources.list
    then echo "CRAN seems to be already in /etc/apt/sources.list"
    else
      CODENAME=`lsb_release --codename | cut -f2` # Ubuntu codename
      sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 # Signed by Michael Rutter <marutter@gmail.com>
      echo "deb http://cran.es.r-project.org/bin/linux/ubuntu $CODENAME/" | sudo tee -a /etc/apt/sources.list # For Spain: http://cran.es.r-project.org/
  fi
  echo "Updating sources..."
  #sudo apt-get update -qq

  # We install prerrequisites
  sudo apt-get install -y libjpeg62

  # We install R now
  #sudo apt-get install -y r-base
  #sudo apt-get install -y r-base-dev # In case any R package needs to be built up from source
  #sudo apt-get install -y r-recommended

  # Then, R studio
  RSTUDIO_FILENAME="$RSTUDIO_VERSION.deb"
  URL="http://download1.rstudio.org/$RSTUDIO_FILENAME"
  echo $URL
  cd ~/tmp
  wget $URL
  sudo dpkg -i $RSTUDIO_FILENAME
  rm $RSTUDIO_FILENAME

  # Then personalise R studio
  
fi
