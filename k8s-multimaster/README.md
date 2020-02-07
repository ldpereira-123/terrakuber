
# High Availability K8S Multimaster

## Environment

1.  haproxy balancing connetions to the masters node

1.  Masters node in high availability balancing the connection to the workers node

3.  Workders node in high availability supporting all the containers

![Imgur](https://i.imgur.com/8OCiMZS.png)

## Project

```
.
├── README.md
├── kubernetes
│   └── yamls
│       ├── app
│       │   ├── app-v1-deployment.yaml
│       │   ├── app-v2-deployment.yaml
│       │   ├── pod-app-v1.yaml
│       │   └── pod-app-v2.yaml
│       ├── plugins
│       │   └── nginx-ingress-mandatory-controller.yaml
│       └── services
│           └── ingress.yaml
└── terraform
    ├── main.tf
    └── modules
        ├── haproxy
        │   ├── configs
        │   │   └── haproxy.cfg
        │   ├── main.tf
        │   ├── playbooks
        │   │   └── haproxy_installation.yaml
        │   └── variables.tf
        ├── k8s-ASG
        │   ├── main.tf
        │   └── outputs.tf
        ├── k8s-masters
        │   ├── main.tf
        │   ├── playbooks
        │   │   ├── dependent_packages.yaml
        │   │   ├── disabling_swap.yaml
        │   │   └── k8s_installation.yaml
        │   └── variables.tf
        └── k8s-workers
            ├── main.tf
            ├── playbooks
            │   ├── dependent_packages.yaml
            │   ├── disabling_swap.yaml
            │   └── k8s_installation.yaml
            └── variables.tf
```