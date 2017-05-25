# Docker Orchestration workshop

Docker Captain Scott Coulton

scottcoulton

## Workshop slides and code

https://github.com/scotty-c/orchestration-workshop

## Play with Docker

- play-with-docker.com is awesome!
- Status icons indicate Docker status (none, manager or worker).
- Adjust terminal size.

## Supergrok

[Supergrok](https://github.com/jpetazzo/supergrok) provides a proxy so we can view our app running on play-with-docker.com. I think...

## Why did Docker create Moby

- Resolves the confusion around "Docker" the product vs "Docker" the client/engine
- Peeps were pissed that orchestration was being bundled with Docker. K8 mad!
- Moby is the upstream of Docker Inc.
- Packaging of Docker CE and Docker EE is closed.
- But as all Docker projects are now open source, projects like K8 can now construct their own container runtime.

## Docker versions

- Docker CE releases are maintained (patched) 4+ months
- Docker EE releases are maintained (patched) 12+ months

## Docker tools

Tools such as secrets management, singing of images is Open Source but its pretty hard to setup, hence EE.

## Docker DNS

Every container at 127.0.0.11 has a DNS server available to it. 

## Docker Security

- Docker by default can be broken out of: 
- previledge escalation kernel patch required.
- Create user, add to Docker group but make sure Docker group and user not privledged.
- `--security-opts` - app armour and SELinux and you can apply that as one option.
- But... app armour with orchestration is really tough.
- Looking at pushing up these security controls through capabilities and they translate into SELinux or App Armor in the background.
- Don't run `pidhost` or `nethost` - ok for development, but never in prod. Be aware of the risks.
- Who's responsible for securing the running of Docker? - Scott thinks SRE, Security and Ops
- Who owns the crypto signing? Probably not Ops, probably Sec.
- Using runc or containerd directly can reduce a lot of security issues but is more complex to support and implement.
- CIS Engine benchmark

## Docker Compose nuggets

- `docker-compose --logs` (many of the same options as `docker logs`) exposes logs for the whole app.
- `Stacks` only work on Compose v3.1 files and above.
- `Stacks` only work on Swarm.
- Compose is now a way to "compose" services that can be deployed with Swarm. The history is confusing. Compose v 3.1 files are the way forward.

## Swarm

- Since 1.12
- Forget anything before SwarmKit.
- Don't put containers on management nodes.
- 3 nodes is good for most use-cases.
- If the root key from the master node is comprimised, you can change the root key on the fly and boot any hacking nodes that joined using the old key. Pretty cool!
- Integration with [overlay networks] and [load balancing]
- Any node can be a worker or manager but only operational tasks can be done on a manager (operate with [least privledge](https://en.wikipedia.org/wiki/Principle_of_least_privilege).
- Only ever ONE manager leader at a time. Checks every minute or so.
- Docker can snapshot your configuration so you can roll-back.
- Docker engine talks to Swarm through the SwarmKit API
- Swarm Management: Swarm => Docker CLI => SwarmKit?
- Manager node location cannot be discovered from a worker node for security. 
- TIP: If using Multihoming, you'll need to use `--advertise-addr` to choose.

    $ docker swarm init --advertise-addr 10.0.13.3
    Swarm initialized: current node (rkexwo2b2numi48ruj5qmt9et) is now a manager.

    To add a worker to this swarm, run the following command:

        docker swarm join \
        --token SWMTKN-1-3n2uiepbd7vy06rsuon8zw36zbk27l9mq0b87s4c5ru1tznyrt-1zlfc48x8mx27uydlg32pvrsy \
        10.0.13.3:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

- Two keys: Manager key and Worker key.
- `docker info` also displays Swarm info. `docker info` displays more Swarm metadata on the manager node but not the worker node.
- Kubernetes is a lot more configurable, but a lot more work. Great for managing thousands of nodes or that have complex requiurements.
- For most people, Docker Swarm is going to be enough.
- Play with Docker is awesome for testing out Swarm as you can create multiple instances.
- Under the hood, tokens prevent [MITM attacks](http://www.computerworld.com/article/2475102/cybercrime-hacking/steve-gibson-s-fingerprint-service-detects-ssl-man-in-the-middle-spying.html)

## Swarm issues?

- It's probably to do with the KV store as so much information (network, nodes etc), it's all in there.
- If you lose all of the manager nodes, the worker nodes will continue to run, but you'll need to create a new cluster with new mangaers and migrate.
- Create separate clusters in multiple AZs and have a load balancer manage traffic between them. Advice was to not have Docker swarm manage nodes across different AZ, Kubernetes has the same recommendations.]
- If you try to scale up but don't have the resources? An error will be thrown which could be listened for and used to trigger the changing of an autoscale/instance number rule.

## WTF is Raft?

- KV store used for storing of tasks and state.
- Docker has built their own Raft implemenetation so SSL is built-in, turned on and performant.
- [https mesh routing](https://success.docker.com/Architecture/Docker_Reference_Architecture%3A_Universal_Control_Plane_2.0_Service_Discovery_and_Load_Balancing#The_HTTP_Routing_Mesh)

## Questions asked?

 - How do I learn about Linux?
   - E.g, basic concepts?
- How does Docker fit in to architecture? E.g. Serverless and Docker or not Docker? 
- When do you recommend to your client to *use* Docker containers vs Serverless vs ?
- Health check: Swarm can use them but something like Prometheus can then trigger Swarm.
- How do Configuration Managment tools fit it with Swarm?
    CM tools (e.g. Chef/Puppet) configure the artifacts (e.g. VM) but a job/task through a CI/Deployment tool is the thing that will coordinate the deployment and management of resources.

## Random Insights

- Linux Kit to build specific purpose VMS. In minutes!
- Sign and distribute containers. By default! Today!
- Easiest way to learn Docker - [Training and Play with Docker](http://training.play-with-docker.com/)

## Random

- tmux (according to Scott) is good (better than screen): Maybe?
    - https://tmux.github.io/
    - https://robots.thoughtbot.com/a-tmux-crash-course
    - https://dominik.honnef.co/posts/2010/10/tmux-vs-screen/
    - https://superuser.com/questions/236158/tmux-vs-screen
    - https://brandonwamboldt.ca/tmux-vs-screen-1817/
