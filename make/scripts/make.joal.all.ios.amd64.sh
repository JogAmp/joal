#! /bin/sh

if [ -e /usr/local/etc/profile.ant ] ; then
    . /usr/local/etc/profile.ant
fi

#    -Dc.compiler.debug=true 
#

# Force OSX SDK 10.6, if desired
# export SDKROOT=macosx10.6

export SDKROOT=iphonesimulator13.2
xcrun --show-sdk-path

JAVA_HOME=`/usr/libexec/java_home -version 21`
PATH=$JAVA_HOME/bin:$PATH
export JAVA_HOME PATH
which java
java -version 

export GLUEGEN_CPPTASKS_FILE=make/lib/gluegen-cpptasks-ios-amd64.xml

#export JOGAMP_JAR_CODEBASE="Codebase: *.jogamp.org"
export JOGAMP_JAR_CODEBASE="Codebase: *.goethel.localnet"

ant \
    -Drootrel.build=build-ios-amd64 \
    $* 2>&1 | tee make.joal.all.ios-amd64.log
