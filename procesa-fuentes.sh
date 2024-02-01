#!/bin/sh

#funcion de error: usage
usage(){
    echo "usage: $0 [-u --url] / [-a --arch]"
    exit 1
}

n=0
v=0
if [ $# -eq 0 ]; then
    #guardamos en la variable files todos los ficheros del dir
    files=$(ls /tmp/sources.list.d)
    for f in $files; do
    #recorremos todos los ficheros y les concatenamos su path
        f=/tmp/sources.list.d/$f
        if [ "$(cat $f | grep -q 'deb')" != "\0" ]; then
            n=$(($n+1))
        fi 
    done
    echo "Total deb encontrados: $n"
elif [ $# -eq 1 ] && ([ $1 = "-u" ] || [ $1 = "--url" ]); then
    #guardamos en la variable files todos los ficheros del dir
    files=$(ls /tmp/sources.list.d)
    for f in $files; do
    #recorremos todos los ficheros y les concatenamos su path
        f=/tmp/sources.list.d/$f
        if [ "$(cat $f | grep 'https')" != "\0" ]; then
            n=$(($n+1))
        fi
    done
    echo "Total de URLs: $n"
elif [ $# -eq 1 ] && ([ $1 = "-a" ] || [ $1 = "--arch" ]); then
    #guardamos en la variable files todos los ficheros del dir
    files=$(ls /tmp/sources.list.d)
    for f in $files; do
        #recorremos todos los ficheros y les concatenamos su path
        f=/tmp/sources.list.d/$f
        if [ "$(cat $f | grep 'am64')" != "\0" ]; then
            n=$(($n+1))
        fi
        if [ "$(cat $f | grep 'i386')" != "\0" ]; then
            v=$(($v+1))
        fi
    done
    echo "ARQUITECTURAS"
    echo "-----------------------------------"
    echo "i386: $v"
    echo "md64: $n"
else 
    usage $0
fi

exit 0