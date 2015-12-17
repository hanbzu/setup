#!/bin/sh

IDEA_HOME=/opt/idea
export JAVA_HOME=/usr/lib/jvm/jdk-8u5-tuxjdk-b08/
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd \
                      -Dsun.java2d.xrender=true"
export GNOME_DESKTOP_SESSION_ID=this-is-deprecated
exec $IDEA_HOME/bin/idea_original.sh "$@"
