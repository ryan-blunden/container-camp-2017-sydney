# Kubernetes and the rise of Serverless

[Angus Lees](https://github.com/anguslees) - Bitnami

## Why

Google was using containers over 10 years ago so for them, it's boring technology.

Drive towards the future of boring features that are sharable (e.g. image thumbnail creation) at scale.

## What

- Pre-packaged K8s stack (Helm Charts)
- kubecfg, kompose
- Stacksmith (images)
- Functions-as-a-Service (kubeless)

## Use case

"I want a webhook that lievs alongside my app".

Questions:

- Where should it live? 
- Who should know about it?
- Who maintains it?

If the answer right now is "in my app/middleware framework", its a lot of work for a potentially small amount of return.

E.g. Thumbnail creation on image upload.

## Kubeless

Designed for the "simple 20 line" jobs.

NOT designed for the "massive instant scale" use-case.

NOT for plug-in/event based architecture integrated into cloud vendor APIs.

CAN be for consuming Kubernetes events though. Comes back to Brandan Burns' comments that Kubernetes deployments need to get better at being "event driven".

- Simple by design.
- Node.js, Python Ruby and more on the way.
- Get Prometheus metrics, error handling etc for free via runtime.
- Get as much from native Kubenetes as possible.

Third party resource so can also be used from kubectl

## Cool Links

- [kubeless-ui](https://github.com/kubeless/kubeless-ui) (GUI for Kubeless)
