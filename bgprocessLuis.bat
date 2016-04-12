#!/bin/sh
#set -x

. /etc/profile

BGPROCESS_HOME=$BGPROCESS_HOME

if [ "X$JAVA_HOME" = "X" ]
then
	echo "JAVA_HOME is not set. Please set it."
fi

if [ "X$BGPROCESS_HOME" = "X" ]
then    
        echo "BGPROCESS_HOME is not set. Please set it."
fi

LIB_DIR="$BGPROCESS_HOME/lib";
DELIM=":"
FILE_LIST=`ls -1 $LIB_DIR/*.*`
CPATH="."

for FILE in $FILE_LIST
do
        #echo $FILE
        TMP="$FILE"
        CPATH="$CPATH$DELIM$TMP"
done

CLASSPATH=$CPATH
export CLASSPATH


CLASSPATH="$BGPROCESS_HOME/conf-db/":"$BGPROCESS_HOME/conf/":$CLASSPATH

export CLASSPATH

JAVA_OPTS="-Xms1024m -Xmx1024m -Xmn512m"
CONF_FILE="$BGPROCESS_HOME/conf/startup.properties"

echo "********************************************************************************************************"

echo "BGPROCESS HOME  : $BGPROCESS_HOME"
echo "JAVA      HOME  : $JAVA_HOME"
echo "JAVA      OPTS  : $JAVA_OPTS"
echo "START     CONF  : $CONF_FILE"

echo "********************************************************************************************************"


	exit 0
fi

