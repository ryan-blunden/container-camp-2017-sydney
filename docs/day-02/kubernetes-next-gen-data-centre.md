# Kubernetes and the next generation data centre

James Buckett - Levvel.io
@jamesbuckett

Federation is a cluster of clusters.

[Kubernetes Federation](https://kubernetes.io/docs/concepts/cluster-administration/federation/)

## Warning

Kubernetes Federation is v1beta1.

## Why?

- *Freedom*: Move the worksloads where you want (region or cloud provider).
- *Finance*: Ability to shift workloads for reduced cost.
- *Failure*: High availability.
- *Flare*: Cloud burst. Quickly scale up.

## What

- Enables multi-grographical locations (region)
- Enables multi-vendor.
- Enable on-premises and cloud.

Wanting a native Kubernetes installation so all he has to worry about is the applications.

## Building a federated clouser

- Create a DNS managed zone.
- Provision the fenderated API server.
- Provision the federated controller manager.
- Adding clusters to the federation.

## Federation control plane

- federation-apiserver.
- federation-controller-manager.
- no scheduler yet (manual step to move workloads between clusters).
- etcd.

## Demo
