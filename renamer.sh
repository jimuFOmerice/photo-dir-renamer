#! /bin/bash

TARGET=/vagrant/files/

LIST=`ls -d $TARGET*`

for DIR in $LIST
do
    FILES=`ls $DIR/*`
    for FILE in $FILES
    do
        FDATE=`jhead $FILE|grep "Date/Time"|cut -d: -f2-|cut -c2-12|sed -e "s/://g"`
        if [ -n $FDATE ];then 
            break
        fi
    done
    if [ ! -d $TARGET/$FDATE ];then 
        mv $DIR $TARGET/$FDATE
    else
        echo "$TARGET/$DIR already exists."
    fi
done
