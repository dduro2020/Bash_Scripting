#!/bin/sh                                                                      

usage()
{
	echo usage: ./crfiles [dir] 1>&2
	exit 1
}

if [ $# -eq 1 ]; then	
	if [ -d "$1" ] ; then
		cd $1
	else
	    echo error: could not open dir $1 from /tmp 1>&2
		exit 1
	fi
else 
    usage
fi

for i in $(seq 1 20); do
    touch $i.q
done

#rename=$
mv $1  $1_done

exit 0