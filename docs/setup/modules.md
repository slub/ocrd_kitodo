## OCR-D Manager

### Environment Variables

{% include '_generated/env-manager-table.md' %}

## OCR-D Monitor

Provides a simplistic Web interface under http://localhost:5000 for
- browsing workspaces with [OCR-D Browser](https://github.com/hnesk/browse-ocrd) to inspect intermediate/final processing results
- getting statistics of running and terminated jobs
- reading and searching Docker logs

### Environment Variables

{% include '_generated/env-monitor-table.md' %}

## OCR-D Controller

> Without this, you must build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller)
> _externally and possibly remotely_.

> In addition, you _must_ also [configure](#configuration) where the Manager can find
> that standalone Controller. _For example_, you may want to set:
>
>     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022
>

> Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the
> private key used by the Manager.

#### Environment Variables

{% include '_generated/env-controller-table.md' %}

## Kitodo.Production

Enables the `kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq` services.

> Without this, you may want to build, configure, start and stop [Kitodo.Production](https://github.com/slub/kitodo-production-docker)
> _externally and possibly remotely_.

> If you _do_ want to connect an external Kitodo with the Manager, you _must_ also
> set up its `OCRD_MANAGER` environment variable so it can find the Manager over the network,
> and a SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager.

## Environment Variables

### Application

{% include '_generated/env-app-table.md' %}

### Database

{% include '_generated/env-db-table.md' %}

### Elastic Search

{% include '_generated/env-es-table.md' %}

### Active MQ

{% include '_generated/env-mq-table.md' %}