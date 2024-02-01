#!/bin/sh

usage()
{
	echo usage: dirs.sh >&2;
	exit 1
}

if [ $# -ne 0 ]; then	
    usage
fi

files=`ls | egrep '.*\.dir$'`
#mkdir $dir
#cd $dir

for file in $files; do
    dir=`cat $file | awk 'NR==1'`
    data=`cat $file | awk 'NR>1'`
    if ! [ `ls $PATH/$dir 2>/dev/null` ]; then
        mkdir $dir
    fi

    #cd $dir

    while read line
    do
        if [ $n -ne 0 ]; then
            name=`echo $line | awk '{print $1}'`
            lines=`echo $line | awk '{print $2}'`
            var=`echo $line | awk '{print $3}'`
            names=$PATH'/'$dir'/'$name
            echo $names
            nano $name
            for i in $(seq 1 $lines); do
                echo $i"\n" >> $name
            done
        fi
        n=1
    done < $file
    
done