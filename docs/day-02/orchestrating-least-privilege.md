# Orchestrating Least Privilege

Diogo Mónica - Docker

@diogomonica

## What is least privilege

Orchestrator that follows the principle of least privilege in the best way possible.

## Why least privilege?

Design your architecture and applications in a way so you can withstand attackes.

## Types of attacks

 1. External (e.g. outside firewall)
 1. Internal (already has access to internal network)
 1. Passive Listener Attacker (listing and everything)
 1. Malicous Worker attacker (worker node comprimised)
 1. Malicious Manager Attacker (orchestrator comprimised)

## Where are we at with Orchestrator Security?

- Not a single purpose musician, but a street perfomer that does ever.

## How to mitigate attackers

### External

- Whitelist (e.g. ports), not blacklist
- Finely tuned access control (only the web-service can access the payment processing service)
- Your applications should encrypt communication between systems (microservices, db)

### Mitigating Malicous Worker

If a worker is comprimised, no info is available to comprimise the manager.

### Mitigating Malicous MAnager

The workers do not *blindly* trust the manager. E.g, checking signed images to ensure they are what they're meant to be.

## How is Swarm executing least privilege?

- Mutual TLS by default. When you start a Swarm cluster, generates a new self-signed CA cert.
- New nodes get certificates created (and rotated) and setup for free just by running Swarm.
- Swarm ensures that nodes communicate over TLS always. 
- Secure by default.

## How does Swarm does secrets?

- Workers only delivered the secrets they need from a manager.
- Secrets are encrypted on the worker node (encrypted at rest) in a RAM disk (memory but on file system).
- Works to least privilege as workers only get what they need. No secrets needed? No secrets given.
- When a container is removed from a node, the secrets are removed from memory as well.

