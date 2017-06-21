#!/bin/bash
# This script is intended to be run as a docker volume mount in
# /kb/deployment/bin
# Build the Shock executable and copy it into the /kb/deployment/bin directory
# This script expects that the environment variable COMMIT be a git commit hash
# that represents the commit within the Shock repo to build

export GOPATH=/tmp/goroot
DEST=`pwd`

mkdir -p $GOPATH/src/github.com/MG-RAST
go get github.com/pborman/uuid
go get github.com/MG-RAST/golib
go get github.com/MG-RAST/go-dockerclient
cd $GOPATH/src/github.com/MG-RAST
git clone --recursive https://github.com/kbase/AWE
cd AWE
git checkout $COMMIT
cd awe-server
go build
cp awe-server /kb/deployment/bin/
cd ../awe-client
go build
cp awe-client /kb/deployment/bin/
echo AWE server and client binaries copied to /kb/deployment/bin
