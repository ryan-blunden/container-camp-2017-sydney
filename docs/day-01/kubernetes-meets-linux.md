# Linux meets Kubernetes

Vishnu Kannan

https://www.linkedin.com/in/vishnukanan

https://github.com/vishh?tab=repositories

## Overview

- Master node and worker nodes
- Containers enable you to focus more on your application and less on where it runs.
- Kubernetes does not use Docker, but uses parts of the Moby project (e.g. runc).

## The anatomy of a running Docker container

- Overlay (type) filesystem (copy-on-write)
- Control groups (cgroups): Restrict resources, track processes
- Namespaces (virtual context, process trees, network interfaces, users and groups, mounted filesystems).
- Security: Seccomp, Capabilities, AppArmor, SELinux, Filesystem permissions. Provide least privilege.
- Volumes: Simply any data that *is not* within your overlay file system. Allows data used by your container to live beyond the life of the container.
- Network: Bridge + Veth + Iptables, Overlay and Underlay, eth0 and loopback.

## Pods

Now that we all have a common understanding of a container, what is a pod?

One or more tightly coupled containers and volumes.

Pods let you build microservices:

- Shared Linux namespace.
- Shared storage.
- Shared network interface.
- Shared control groups.

## Demo

Code: Github (will update when I know the repo)

## My side-notes

My opinionated and supposed insights, not what Vish said.

### We need to get better at explaining what is:

- Image
- Container
- Docker
- Docker Inc.
- Moby

For example, a Debian Docker container does not have a Debian built Linux kernel, it is utilising the kernel from the host. All a Debian image is, is a subset of the binaries and file system structure of Debian.

### A Docker orchestration journey

We need to help the community understand:

- The different orchestrators.
- Which ones fit which purpose.
- How to move from simpler (Docker Swarm, ECS) to more powerful (Kubernetes) and how to translate the learnings so it doesn't feel like they've learnt two different orchestrators.

## Cool links

- [unshare](http://blog.endpoint.com/2012/01/linux-unshare-m-for-per-process-private.html)
- [CNI](https://github.com/containernetworking/cni)
