# Rootless Containers with runC

Aleksa Sarai - SUSE

@lordcyphar

## Overview

Essentially all popular container runtimes require some form of root privileges in order to create and manage containers. This becomes a problem for certain systems, where administrators are hesitant to install any software, let alone a container runtime -- many of which allow for privileged containers without authentication.

Containers are mostly makde of Linux kernel namespaces.

We want isolation but want it without privileges.

The key kernel feature is USER namespaces [docs](https://success.docker.com/KBase/Introduction_to_User_Namespaces_in_Docker_Engine)

*Note*: Most of this talk went over my head too so, hence the lack of notes. Cool stuff though!

## Runc Updates

Recently, runc got support for rootless containers but not everything works. [More info](https://www.cyphar.com/blog/post/rootless-containers-with-runc).

[Github merge](https://github.com/opencontainers/runc/pull/774).

## Tools

skoeo - Download and convert images from various sources and registries.
umoci: Unpack, repack and otherwise modify local OCI images.

## Summary

Suse is doing some really cool stuff to not only run containers withot root privileges, but also building containers without them as well.

## Cool Links

- https://rootlesscontaine.rs/
- https://build.opensuse.org/
- https://doc.opensuse.org/projects/kiwi/doc/

