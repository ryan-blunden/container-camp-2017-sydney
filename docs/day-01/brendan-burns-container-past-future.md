# Container Journey: Past, Present, and Future

Brendan Burns, Microsoft Azure
@brendandburns

## Containers are cool, but...

You shouldn't really care about containers, microservices etc.

You *should* care about a quality product, your users and customers, your team.

Containers and container technology simply enable you to do a better job of doing the things you care about for who you care about.

What may have been an awesome bash script that only worked on Debian 2 years ago, now can be packaged into a container and available to anyone running containers.

## Why did containers take off?

- It was the ultimate way to package your (largely) application irrespective of the environment in which it would run.
- It fitted the CI/CD model beautifully but made it fly with quicker and smaller artefacts.

### Positive impacts

Because a container IS NOT a VM, it forced Devs and Ops to carefully think about the boundaries between the container and the host. "What should be in this thing" forced conversations to happen earlier in the development and deployment process.

### Dependency isolation

Freeing the application from caring about what else is on the machine.

### We need an orchestrator

Moved the orchestration concern from the cloud vendor to the software level

Why do you need an orchestrator? O(N) = O(1) Run (n) things at the same cost as (1) things.

## Orchestration benefits

- If a container dies or is unhealthy, the orchestrator self heals without the developer of the app/container writing any code.
- Scale up and down with a command or configure auto-scaling (although orchestrators *should not* be cloud API aware.)

## Kubernetes - Services

- Services provide load balancers at every tier of your stack so you can individually scale and manage each service individually. 
- Not just about running containers, but running services and isolating them from one another.
- As we're now de-coupled from the machine, the machine used to be the identity (e.g. db-1).
- Services now give us a way to identify the parts of our system, but we don't want to name the containers, we want to name the services, the parts of our system.
- This all fits beautifully with microservices architecture which explains why Docker, Orchestrators and Microservices have fuelled the growth of each other.

## We are we at with Container Orchestration? The commoditisation phase

- It's a commodity. Spin up a complex cluster in 1 or maybe 2 commands.
- The price is in the price of the compute power, not in the orchestration software.
- Containers mark the first real version of "cloud native" architecture. 
- While VM's gave us *quicker* access to a machine, containers changes how companies will build PaaS and make it affordable and approachable for smaller and niche players to compete with larger vendors due to the commoditising of things such as deployment, packaging, load balancing, distributing load. 
- With container orchestration, a Heroku *style* workflow is now approachable for teams of all sizes.

This also commoditises many of the services offered by cloud companies as the cloud vendor APIs and capabilities matters, less. All that matters is that it can run the orchestrator well.

## The future

- Easier to get started (not teach best practices, they are there by default (e.g. restart if crash), automate more, self-heal, standard patterns (health checks).
- Building distributed systems as a standard application design pattern.
- Distributed systems are or are becoming microservices.

## We need the right stuff done by default

- Logging
- Monitoring
- Security

Help people fall into the pit of success and spend time on making a great product, not arguing about which monitoring, or worse, live debugging in production because monitoring doesn't exist and production is down.

### Lets take monitoring

1. statsd
1. Prometheus
1. Isn't that what logs are for? (no monitoring)

Orchestrators should have really good built-in monitoring.

Customised monitoring solutions should integrate natively into the orchestration solution at the service/cluster layer so the implementation so that monitoring is implemented the same way for each cluster/service every time.
time every timeevery timeevery timeevery timeevery timeevery timeevery timeevery timeevery timeevery time every

## Kubernetes and Third party APIs

We need to move to a more explicit way to describe our environment while working within the extensibility constraints of orchestration tools.

You can now declare *new types* (e.g. Load Test Extension API):

- Registers a new API URI for requesting load tests.
- Also watches for the deployment of new versions of specific applications.
- Runs a load test on demand perhaps as part of the blue-green deployment process to ensure that the service is truly ready for production traffic.

## Cool links

- [Kubeless](https://github.com/bitnami/kubeless) – Serverless Framework for Kubernetes.
- [Helm](https://helm.sh) - The Kubernetes Package Manager
- [kube-lego](https://github.com/jetstack/kube-lego) - Kube-Lego automatically requests certificates for Kubernetes Ingress resources from Let's Encrypt
- [Deis, Inc](deis.io) - The Kubernetes Company
