# Mixing cgroupfs v1 and cgroupfs v2: finding solutions for container runtimes

Christian Brauner - Canonical

brau_ner

## Note

*All of this talk went over my head.* The notes I've taken are probably inaccurate, wrong or at least severely lacking detail.

But I loved that we had a presentation from someone with such deep knowledge of the Linux kernel present.

## Cgroups

- Pseudo kernal filesystem following the vfs
- colllection of processes
- resource management and tracking (e.g. CPU, memory, disk I/O, network, etc).

croups can also do things like only allow this process to use processes 1-2.

## cgroup v1

`ls -al /sys/fs/cgroup`.

All current container runtimes use cgroup v1.

## cgroup v2

There can only be one heirarchy, distributed top down.

Did not really understand anything else beyond this point...

## What does this mean for runc

Everything is fine for now, as long as your not using a vgroup v2 hiearachy or a hybrid hierarchy.

## To make sure runc is not broken for you in the future

*Warning: This has not been tested and verified by me yet*.

Change `GRUB_CMDLINE_LINUX_DEFAULT` in `/etc/default/grub` so that it looks like this:

    GRUB_CMDLINE_LINUX_DEFAULT="quiet systemd.legacy_systemd_cgroup_controller=yes"

Credit: https://github.com/moby/moby/issues/28109#issuecomment-259122113
