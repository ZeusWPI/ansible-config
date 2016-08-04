#!/bin/bash
ABYSS=root@abyss.kelder.zeus.ugent.be
FILE=/opt/etc/rsnapshot.conf
NOW=$(date +'%Y-%m-%f-%H:%M')
if [ -f abyss/rsnapshot.conf ];
then
    scp abyss/rsnapshot.conf $ABYSS:$FILE.new
    ssh $ABYSS << HERE

    bash #fucking ash
    if cmp -s $FILE.new $FILE; then
        echo 'No difference in rsnapshot.conf.'
        rm $FILE.new
    else
        echo 'rsnapshot.conf is different. Overwriting and backing up old file.'
        mv $FILE $FILE.$NOW || true
        mv $FILE.new $FILE
    fi
HERE
else
    echo 'File abyss/rsnapshot.conf not found!'
fi

