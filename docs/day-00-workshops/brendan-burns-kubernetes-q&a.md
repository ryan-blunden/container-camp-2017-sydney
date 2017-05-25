# Brendan Burns Kubernetes and Containers Q&A

https://twitter.com/brendandburns

https://github.com/brendandburns

Kubernetes co-founder

[Azure Cloud Shell](https://azure.microsoft.com/en-au/blog/public-preview-of-azure-cloud-shell/)
Powershell coming soon which will be Windows Docker containers being orchestrated by Kubernetes.

Images need to use labels to indicate architecture (ARM) or OS (Windows) otherwise, the orchestrator.

## hyper.sh

Hyper is a Dockerlike API but it launches them inside a Linux hypervisor. Caveat: The cloud doesn't work with nested virtualisation really.

## Secrets Management

Where does the *trust* come from? It doesn't come from anywhere because someone has to have access somewhere.

Secrets File as a RAM disk in case the machine gets comprimised (Similar to Docker Swarm secrets.

It's more about understanding the threat models and mitigating those that matter as much as possible.

Problem: Identity and a container. WHO is a container? Who does it run as? What is it allowed to do/get/read/write.

- Identities are more like roles. E.g, a `front-end` (role) identity, not a `nodejs` (type) identity.

## Kubernetes networking

- Each container has an IP address. Why?
  - Application oriented API.
  - Uses the Cloud routing API to get a routable IP address for each container. 
  - Kubernetes namespaces provides isolated networks for containers to talk to each other to.

## Question: Why Kubernetes vs ECS?

  Managed    |    Unmanaged
  < ops      |    > ops
  < freedom  |    > freedom


  ECS        |    Kubernetes
  < Lock-in  |    > Freedom
  < Closed   |    > Open

## For AWS:

- kops
- kubeadmin

## Is Kubernetes too heavy?

Question is too simplistic. More configuration up-front yes.

- Deis (Heroku style workflow ontop of Kubernetes).
- Helm: Application package manager.

## Bridging the old and new worlds

Need to be flexible. E.g. RDMS. Find a way to inject it hostname/ipaddress into your microservices stack so it "seems" like its from the new world, its not. 

We should stop bashing those who create "fat" containers. This is the real world and not everyone can or is converting their systems to microservices.

We need to be accepting of everyones unique circumstances, skills and constraints and simply help them embrace Docker where it makese sense and as best they can.

## Serverless vs Functions As a Service (FAAS)

Is serverless when you don't care about the machine, host. In that way, Docker can be a form of serverless architecture.

FAAS in the future might simply be a certain type of application deployed via a container orchestrator.

As scale increases, Lambda run per request at 1,000's of requests per seecond isn't neccesarily cheaper. No silver bullet.

But managing a very specific action as a result of a request from say a webhook is a great idea, but it doesn't have to be on Lambda.

## Should we be automating everything?

Yes. More from the point of view it forces you to ensure that everything is thoroughly tested, bullet-proof and has thought about all the different things that can go wrong.

## How to learn Kubenetes?

`kubectrl` doesn't help. It helps you get Kubenetes deployed and up and running quickly and more easily, but all it does is hide details from you that you must now before you go to production.

## NoOps. Is it real?

No.

What is happening though, is that the coupling between the application/workload and the host OS is being severed.

So perhaps *LessOps* is a better term.

No matter what, we now have lots of different "Ops" to care about now:

- AppOps
- SecOps
- ClusterOps
- SysOps
- NetOps
- StorageOps
- KernelOps
- Data/Backup Ops
- ChatOps

So the ability to be clear about responsibilities and how teams hand-off and work together (not just blame each other) is so important.

Writing tutorials and great docs is a crucial skill these days as the surface-area of concepts grows exponentially.

## What's the next killer feature for Kubernetes

- Eventing 
- Identity, Pod level identity
- Slowing down and stopping adding new APIs.
- Better user guides to help people learn how Kubernetes works, not just hiding the details with `kubectl`.