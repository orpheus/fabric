#!/bin/bash

NAME=$1

if [ -z "$NAME" ]; then
    NAME="orderer";
else 
    NAME="orderer-$NAME";
fi

go build -o ~/code/github/orpheus/go/fabric/bin/$NAME ~/code/github/orpheus/go/fabric/cmd/orderer/...
 
echo "Orderer: "$NAME" built"
