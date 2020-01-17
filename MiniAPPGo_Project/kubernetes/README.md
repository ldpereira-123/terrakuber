# Overview

This folder describes how I've create the Kubernetes engine for this mini project

# Schema

First you must setup your cluster for default operation and then use this files to create the Kubernetes environment

---

***The most important thing is turn off the SWAP memory on the machines.***


***Kubernetes wasn't project to swap pod's into the cluster, kubelet can't deal with this.***


***The main Kubernetes pod's ideia is, if your new pod needs 3 GB and your node doesn't have, it goes to another node.***

---

# Environment

![Imgur](https://i.imgur.com/J5qduF3.jpg)

**Yamls** 

```
yamls
├── app
│   ├── pod-app-v1.yaml
│   └── pod-app-v2.yaml
├── plugins
│   └── nginx-ingress-mandatory-controller.yaml
└── services
    ├── ingress.yaml
    └── nodeport_ngnix_service.yaml
```

# Setting Up The Cluster

***All Machines***

**Docker:** `curl -fsSL https://get.docker.com | bash` 

**kubectl:** `See a way to install it on your distribution` 

**Set docker cgroup driver to SystemD:** 

Put this flag: `--exec-opt native.cgroupdriver=systemd` in the `ExecStart` section on Docker service config file 

After: `systemctl daemon-reload && systemctl restart docker`

***Only in the master node:***

`kubeadm init --apiserver-advertise-address $(hostname -i)`

`mkdir -p $HOME/.kube`

`sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config`

`sudo chown $(id -u):$(id -g) $HOME/.kube/config`

***On the nodes***

kubeadm join --token XXXXXXXXX MASTER_IP:6443 --discovery-token-ca-cert-hash sha256:37092


***Install Wave Net Controller. Necessary for communication between master node and the nodes Network environment***

`kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"`

## Verifing

`kubectl get nodes` => See if master node and the nodes are in `Ready` state

`kubectl get pods --all-namespaces` => See if all Kubernetes System Pods are in running state

`kubectl get deployments --all-namespaces` => Se if all Kubernetes System Deployments are in running state


## Post Cluster Setup

**Install mandatory nginx ingress controller:**

kubectl applt -f plugins/nginx-ingress-mandatory-controller.yaml

**Nginx service:**

kubectl applt -f services/nodeport_ngnix_service.yaml
