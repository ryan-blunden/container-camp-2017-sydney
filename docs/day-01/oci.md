# OCI and Open Container Standards

Jonathan Boulle

NStack

@baronboulle

## What is OCI?

Stands for Open Containers Initiative.

Docker did a great job of holding the container commnity together during the last three years. Net result is the [Moby project](https://blog.docker.com/2017/04/introducing-the-moby-project/) which provides open source container tools for everyone.

Its just standards for container runtime and container image format (not the official definition).

- [OCI Image spec](https://github.com/opencontainers/image-spec)
- [OCI Runtime spec](https://github.com/opencontainers/runtime-spec)

## What doesn't hold true about the shipping container metaphor?

- You actually *do* care whats inside it.
- You need to know about the contents of the container in order to use it.

Perhaps we could help the metaphor along by adding a "shipping manifest"?

But there are more problems:

- Shipping containers are fixed size (volume)
- Shipping containers are essenetially state machines:
    - built.
    - empty.
    - packed.
    - shipped.
    - un-packed.

Bottom line is that physical metaphors never map well to computing concepts.

## The quest for a better metaphor

Chees-cake? No.

IKEA furniture instrctions? Getting closer.

Finally... Baron arrives at the Piola.

While I agree that using the piola and music is a much more robust metaphor, the problem is that many people won't know what the piola is!

If they don't, now they have to learn that first, hence it could be more of a barrier of entry to understanding what a `container` in software when using that as the metaphor.

I think this might be one of those examples where "practicality beats purity" and although the shipping container metaphor is far from perfect and Baron's choice of the Piola is indeed *better*, it's may not be as effective.

## I really appreciate the focus on improving the metaphor

This is one of the less sexy problems to try and take on and I really commend Baron for coming up with a much more air-tight metaphor for explaining containers.

How we communicate concepts to people learning things for the first time is a really important thing to focus on.

## OCI Image format

Takes the Dockerfile v2.2 and aims to standardise from this point on:

Anatomy:

- layers
- image index
- config

On disklayout of the container:

- Extracted file system of the image on the host.
- State managemet: create, start, kill, delete, state.
- Encourage platform agnostic support.
