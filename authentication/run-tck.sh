#! /bin/bash

TCK_URL=https://download.eclipse.org/jakartaee/authentication/3.0/jakarta-authentication-tck-3.0.0.zip
TCK_ZIP=jakarta-authentication-tck-3.0.0.zip
TCK_HOME=authentication-tck-3.0.0
WILDFLY_HOME=wildfly/target/wildfly

################################################
# Install WildFly if not previously installed. #
################################################

# TODO - Override WildFly Version

if test -d $WILDFLY_HOME 
then
    echo "WildFly Already Installed"
else
    echo "WildFly Not Installed"
    pushd wildfly
    mvn install
    popd
fi

##############################################################
# Install and configure the TCK if not previously installed. #
##############################################################

if test -f $TCK_ZIP
then
    echo "TCK already downloaded."
else
    echo "Downloading TCK."
    curl $TCK_URL -o $TCK_ZIP
fi

if test -d $TCK_HOME
then
    echo "TCK Already Configured."
else
    echo "Configuring TCK."
    unzip $TCK_ZIP
fi

###################
# Execute the TCK #
###################



