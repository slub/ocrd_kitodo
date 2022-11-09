Enables the `kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq` services.

> Without this, you may want to build, configure, start and stop [Kitodo.Production](https://github.com/slub/kitodo-production-docker)
> _externally and possibly remotely_.

> If you _do_ want to connect an external Kitodo with the Manager, you _must_ also
> set up its `OCRD_MANAGER` environment variable so it can find the Manager over the network,
> and a SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager.

## Configuration

### Application

{% include '_generated/env-app-table.md' %}

### Database

{% include '_generated/env-db-table.md' %}

### Elastic Search

{% include '_generated/env-es-table.md' %}

### Active MQ

{% include '_generated/env-mq-table.md' %}