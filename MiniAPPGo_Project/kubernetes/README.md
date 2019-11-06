# Overview

This folder describes how I've create the Kubernetes engine for this mini project

# Schema

First you must setup your cluster for default operation and then use this files to create the Kubernetes environment

Here's a little help for you initialize your basic cluster operation:


***The most important thing is turn off the SWAP memory on the machines.***

***Kubernetes wasn't project to swap pod's into the cluster, kubelet can't deal with this.***

***The main Kubernetes pod's ideia is if your new pod needs 3 GB and your node doesn't have, it goes to another node. ***


**Docker:** `curl -fsSL https://get.docker.com | bash`

**kubectl:** `See a way are you'll install on your distribution`

**Set docker cgroup driver to SystemD:**

`find /etc -type f,l -name "*docker.service*""`

Put this flag: `--exec-opt native.cgroupdriver=systemd` in the `ExecStart` container configuration file

Some Image:

![Imgur](https://i.imgur.com/QGvld6Y.jpg)
