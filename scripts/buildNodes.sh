#!/bin/bash

for i in "$@"
do
    case $i in
        -p=*|--peer=*)
        PEER="${i#*=}"
        shift
        ;;
        -o=*|--orderer=*)
        ORDERER="${i#*=}"
        shift
        ;;
        --default)
        DEFAULT=YES
        shift
        ;;
     *)

    ;;
esac
done

echo "PEER = ${PEER}"
echo "ORDERER = ${ORDERER}"

if [ ! -z $PEER ]; then
    for ((i=0;i<$PEER;i++)); do
        echo
        echo "Creating peer-$i"
        buildPeer.sh $i
    done
fi

if [ ! -z $ORDERER ]; then
    for (( i=0; i < $ORDERER; i++ )); do
        echo
        echo "Creating orderer-$i"
        buildOrderer.sh $i
    done
fi


if [[ -n $1 ]]; then
    echo "Last line of file specified as non-opt/last argument: $1"
fi

echo


