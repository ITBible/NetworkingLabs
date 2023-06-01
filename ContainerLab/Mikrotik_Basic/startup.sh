#!/bin/bash

LAB_NAME="mikrotik_basic_lab"
CLIENTS=("client1")
CFG_DIR=./configs
PIDS=""

configure_CLIENT() {
    docker cp $CFG_DIR/$1.sh clab-$LAB_NAME-$1:/tmp/
    docker exec clab-$LAB_NAME-$1 bash /tmp/$1.sh 2>/dev/null
}

clear
echo "Creating Bridge"
ovs-vsctl add-br sw1
echo "... Bridge Created"
echo "Deploying Lab"
clab dep
echo "... Lab Deployed"
echo
echo "Switch Configuration"
ovs-vsctl show
echo
echo "Customizing Clients"
for ITEM in ${CLIENTS[@]}; do
    ( configure_CLIENT $ITEM ) &
    REF=$!
    echo "... Customizing $ITEM [$REF]"
    PIDS+=" $REF"
done

echo
for p in $PIDS; do
    if wait $p; then
        echo "Process $p success"
    else
        echo "Process $p fail"
    fi
done
echo