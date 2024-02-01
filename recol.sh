#!/bin/sh

usage()
{
	echo usage: recol.sh >&2;
	exit 1
}

empty()
{
	echo no data >&2;
	exit 1
}

if [ $# -ne 1 ]; then	
	usage
fi

user=''

if [ $1 = '-u' ]; then
    user=`who | awk '{print $1}'`
else
    user=$1
fi

files=`ls | egrep '.*\.data$' | sort -n`
n=`ls | egrep '.*\.data$' | wc -l`

if [ $n -eq 0 ]; then
    usage
fi

cont=0
nums=''
activ=''
for file in $files; do
    if [ -f $file ] && [ `cat $file | awk '{print $1}' | egrep -b "$user"` ]; then
        nums=$nums"\t"`cat $file | egrep -b "$user" | awk 'NR == 1 {for(i=2; i<=NF; i++) printf "%s\t", $i}'`
        activ=$activ"\t"`cat $file | egrep -b "user" | awk 'NR == 1 {for(i=2; i<=NF; i++) printf "%s\t", $i}'`
        cont=1
    fi
done

if [ $cont -eq 0 ]; then
    empty
fi

echo user is $user
echo files: $files
echo $activ | sed -E 's/ /\t/g' | sed -E 's/^\t//g' | sed -E 's/\t$//g'
echo $nums | sed -E 's/ /\t/g' | sed -E 's/^\t//g' | sed -E 's/\t$//g'

exit 0
