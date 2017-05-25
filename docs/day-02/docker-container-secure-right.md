# If It's In a Container It's Secure Right?

Many organsitions don't understand the risks that Docker presents because they think it's just like a hypervisor but more efficient.

## How is container security different?

Traditional model = reactive, simply because it was often difficult to replicate production environments in development.

But thanks to containers, we can take a proactive approach as everything out application needs to work is now available at build time (in our CI/CD system). Don't wait until it gets to prod!

*Old school*: Nessys, AV, HIDS.

*New school*: AppArmor, Clair, Notary.

Old tools scan the VM/host, we also need tools to scan the container image.

If a running container is just a process, we should be able to make that process act with least privilege thorugh something like App Armor.

## The risks

- DoS the host.
- Fork bomb
- Kernel modification
- Privilege escalation.

Make sure the kernal version your running is up-to-date and not vulnerable.

### Container runtime security

Docker *comes with* security features but they are (currently) not enaled by default.

## Protect the engine and runtime

CIS Docker 1.13.0 Benchmark. Boring reading, but pretty important before going into production.

## Some sane defaults

- Dont run `-pid host` or `--net host`.
- Don't bind your daemon to tcp://0.0.0.0:4243. (everywhere, any interface).
- Use TLS for daemon traffic (not enabled by default but there are docs to do this, not hard).

If you know the process(es) running, lock them down with SELinux, AppArmor or soem other tool

## How to add security to Docker

[Clair](https://github.com/coreos/clair) - Vulnerability Static Analysis for Containers

### A better pipeline

1. Build image (Dockerfile).
1. Scan image (Clair).
1. Sign image (Notary).
1. Push image to image registry.

Devs don't have to *do* everything. But initiaing a conversation with securty to, for example, figure out how images will be signed is crucial. Bring security folks in early.

### Don't pull base images from external registries

Take the Dockerfile and buid, scan, sign, push internally. 

### Production container runtime should only run signed images

Enough said. 

### Build, deployment and running audit trail

For compliance, debugging and troubleshooting. Only *one* way to do these things through a centralised CI/CD system.

## Demo

One flag (app-armor profile) prevented the dirtycow privilege escalation hack from working. 

Look for easy security wins and do them ASAP!

## Nist Container security

Run the most minimal OS possible to reduce surface attack area.

## Enter LinuxKit - a way to build container specific OS.

Creates an OS in a few minutes.

- Lean OS, miniaml size and boot time.
- 4.9 kernel (4.10 soon).
- Batteries included (but can be replaced).
- All system services are containers.

Allows you to use any container runtime (e.g. just `containerd` and `runc`).

Many other companies working on this apart from Docker.

Runs on almost anything.

Docker is in LinuxKit, but is running in a container running with `runc`. So to run an nginx docker container: runc => docker => docker run nginx.

It's not inception. It's just processes.

Now allows you to ship a VM (e.g. AMI) as the artifact.


## How is it different to a traditional OS?

- Smaller attack surface.
- Immutable infrastructure
- Sandboxed system services
- Specialised patches and config.
- Full control over build.
- YAML config.

## Questions

### CoreOS vs LinuxKit?

Linux Kit is great for if you're distributing a completely built immutable image to customers (e.g. Puppet Server, Couchbase).
