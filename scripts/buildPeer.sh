#!/bin/bash

NAME=$1

if [ -z "$NAME" ]; then
    NAME="peer";
else 
    NAME="peer-$NAME";
fi

go build -o ~/code/github/orpheus/go/fabric/bin/$NAME ~/code/github/orpheus/go/fabric/cmd/peer/...
 
echo "Peer: "$NAME" built"
