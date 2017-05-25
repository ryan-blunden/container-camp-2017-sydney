# Distributed Command Execution using Containers and Cog

Vincent De Smet - Docker Captain

@vincentdesmet

Overview of Operable Cog (a ChatOps bot) and how it uses containers and Docker hosts to execute command across a distributed set of servers.

**Note**: I need to learn more about ChatOps?

## Chat-ops

- Convenient.
- Transparent.
- Sharable.
- Repeatable.
- Auditable (recorded).

But seems risky! Needs to take security into account.

[Cog bundle wharehouse](https://bundles.operable.cio)

Cog allows you to combine tools to solve complex problems.

Distributed command execution

## Architecture

![Cog Architecture](http://cog-book.operable.io/_images/Operable_Diagram_CogArchitecture.png)

## Cog nice features

Aliases.

## Bundles

- Route 53 for CNAME creation.
- autoscaling.
- cloudformation (Kick Starter).
- GitLab Cog has several bundles.

## Slack setup

Setup channels for diferent environments.

## ChatOps

- Abstract management commands to a higher level. 
- Don't use `kubectl` but instead `orchestrator`. What the orchestration tool is shouldn't matter.
- A custom DSL also provides protection and isolation from people wanting to do bad/wrong things accidentally.
- How to enable/disable/report/log commands?
- What are other companies doing to make what commands people are running more transparent? Do we really need ChatOps for that?

## Cool LInks

- [ConvDev - GitLab Roadmap](https://about.gitlab.com/2016/09/13/gitlab-master-plan/)
