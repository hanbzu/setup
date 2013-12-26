  # Prerrequisites. From here (sept.2013):
  # http://indykish.wordpress.com/2013/09/24/screencast-in-ubuntu-using-openshot/
  sudo apt-get remove -y ffmpeg
  sudo apt-get purge -y ffmpeg
  sudo add-apt-repository -y ppa:jon-severinsson/ffmpeg
  sudo apt-get -qq update
  sudo apt-get install -y ffmpeg
  sudo add-apt-repository -y ppa:sunab/kdenlive-release
  sudo apt-get -qq update
  sudo apt-get install -y libmlt5 libmlt-data libmlt++3 python-mlt5 melt libsox-fmt-all
  sudo apt-get upgrade -y libmlt5 libmlt-data libmlt++3 python-mlt5 melt libsox-fmt-all
  sudo apt-get install -y ladspa-sdk
  sudo apt-get install -y frei0r-plugins