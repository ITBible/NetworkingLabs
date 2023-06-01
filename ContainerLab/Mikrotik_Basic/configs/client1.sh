#!/bin/bash

echo "... Running apt update"
apt update > /dev/null 2>&1
echo "... Installing troubleshooting packages"
apt install net-tools inetutils-ping mtr nano -y