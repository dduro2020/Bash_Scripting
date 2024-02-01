#!/bin/python3

import argparse
import sys

#funcion para imprimir primer numero
def first(ints):
    print("El primer numero decimal es ",ints[0])
    sys.exit(0)

#funcion para buscar numero pi
def pi(ints):
    f=False
    for i in ints:
        if ( i == 3.14):
            f = True

    if (f == True):
        print("La serie SI contiene el número pi")
    else:
        print("La serie NO contiene el número pi")
    sys.exit(0)

#parseo de argumentos
parser = argparse.ArgumentParser(description='Process 1-4 decimals.')
parser.add_argument('integers', metavar='N', type=float, nargs='+', help='an integer for the accumulator')

parser.add_argument('--first', '-f', dest='accumulate', action='store_const',
const=first, default=sum, help='print first decimal (default: sum)')

parser.add_argument('--pi', '-p', dest='accumulate', action='store_const',
const=pi,default=sum, help='search for pi (3.14) (default: sum)')


args = parser.parse_args()
print(args.accumulate(args.integers))

sys.exit(0)