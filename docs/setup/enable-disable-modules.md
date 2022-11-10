Setup of the 4 main modules integrated here, while the OCR-D Manager and OCR-D Monitor is mandatory, the others are optional:

- OCR-D Controller (may be run independently/remotely standalone)
- Kitodo.Production (may be run independently/remotely standalone, or not at all)

You can tell Docker Compose whether to enable (i.e. start and stop) or disable (i.e. ignore)
their associated services, simply by selecting **profiles**.

The most convenient way is by setting the environment variable `COMPOSE_PROFILES` in the shell.


The default in the Makefile is `COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller`,
i.e. enabling both optional modules. Setting any value in the shell will override that default
when using `make` (and also allow using `docker compose` commands directly without `make`):

    export COMPOSE_PROFILES=                       # Running module OCR-D Manager and Monitor only
    export COMPOSE_PROFILES=with-ocrd-controller   # Running modules OCR-D Manager and Monitor + OCR-D Controller
    export COMPOSE_PROFILES=with-kitodo-production # Running modules OCR-D Manager and Monitor + Kitodo.Production
    export COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller # Running all modules 

## with-ocrd-controller

Enables the `ocrd-controller` service.

> **Without** this, you must build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller)
> _externally and possibly remotely_.
>
> In addition, you _must_ also [configure](#configuration) where the Manager can find
> that standalone Controller. _For example_, you may want to set:
>
>     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022
>
>
> Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the
> private key used by the Manager.

## with-kitodo-production

Enables the `kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq` services.

> **Without** this, you may want to build, configure, start and stop
> [Kitodo.Production](https://github.com/slub/kitodo-production-docker)
> _externally and possibly remotely_.
>
> If you _do_ want to connect an external Kitodo with the Manager, you _must_
> set up its `OCRD_MANAGER` environment variable so it can find the Manager over the network,
> copy the SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager,
> and copy the scripts under `./kitodo/overwrites/data/scripts/` to the server's `/usr/local/kitodo`.
>
> See [this Wiki article](https://github.com/slub/ocrd_kitodo/wiki/Adapting-an-external-Kitodo.Production-instance)
> for details.