# Networking Labs
## Introduction
For learning how to troubleshoot and play with networking.

Website: https://itbible.org \
Associated Forum Post: https://itbible.org/threads/network-labs.726/

## Topics
[Container Lab](#Container-Lab)
- [Mikrotik Basic](#Mikrotik-Basic)


# Container Lab
All items in this section require docker along with [Containerlab](https://containerlab.dev/install/). If you're new to either of those we've included scripts with each lab to assist you with spinning up the lab.

**Quick Guide**\
This quick guide will help you understand the naming with our scripts.
- startup.sh - This script will download and deploy your lab, this script will also run some configuration steps inside the lab.
- destroy.sh - This script will completely destroy your lab.
- enter-xxxx.sh - This script will enter the console session for the associated item.

## Mikrotik Basic - _WIP_
This lab will demonstrate a basic network config that I've seen at countless client organizations. We've included some scripts to help with the process if you're new to containerlab.
### Requirements:
- OpenVSwitch: Your switch must be named sw1 _(unless you opt to change the clab config) see [here](#create-openvswitch) for more information_
### Exposed Ports:
- Mikrotik webfig: tcp/8091
- Mikrotik ssh: tcp/2221

# Additional Information
## Create OpenVSwitch
1) Install openvswitch-switch (if using debian)
```
apt update
apt install openvswitch-switch
```
**If you plan to use our startup and destroy scripts you can stop here**\
2) Create switch for use
```
ovs-vsctl add-br <switch-name>
```