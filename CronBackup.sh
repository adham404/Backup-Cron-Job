#!/usr/bin/env bash
dir=$1
backupdir=$2
max=$3
date=$(date '+%Y-%m-%d-%H-%M-%S')
if [ -f "$backupdir/stack.txt" ]
then
    noBackups=`wc -l < "$backupdir/stack.txt"`
else
    noBackups=0
fi
touch "$backupdir/log.txt"
if (( $noBackups==0 ))
then
    ls -lR "$dir" > "$backupdir/directory-info.last"
    cp -R "$dir" "$backupdir/$date"
    cd "$backupdir"
    echo $date >> stack.txt
    let "noBackups+=1"
    cd ..
    echo "$(date '+%Y-%m-%d-%H-%M-%S'): Backup process has been initiated... initial backup executed" >> "$backupdir/log.txt"
fi

ls -lR "$dir" > "$backupdir/directory-info.new"
if cmp -s "$backupdir/directory-info.last" "$backupdir/directory-info.new"
then
    echo "$(date '+%Y-%m-%d-%H-%M-%S'): Files have not been changed since last backup... No backup has been executed" >> "$backupdir/log.txt"
else
    while (( $noBackups>=$max ))
    do
        cd "$backupdir"
        rm -r `head -n 1 stack.txt`
        sed -i '1d' stack.txt
        let "noBackups-=1"
        cd ..
    done
    date=$(date '+%Y-%m-%d-%H-%M-%S')
    cp -R "$dir" "$backupdir/$date"
    cd "$backupdir"
    echo $date >> stack.txt
    let "noBackups+=1"
    cd ..
    ls -lR "$dir" > "$backupdir/directory-info.last"
    echo "$(date '+%Y-%m-%d-%H-%M-%S'): Change detected... new backup has been executed" >> "$backupdir/log.txt"
fi