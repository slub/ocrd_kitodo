Of the 3 main modules integrated here, while the OCR-D Manager is mandatory, the OCR-D Controller and Kitodo.Production are optional.

You can tell Docker Compose the following so-called **profiles** 

- `with-ocrd-controller` profile for module OCR-D Controller
- `with-kitodo-production` profile for module Kitodo.Production

whether to enable (i.e. start and stop) associated services. Without the use of these **profiles** only the services of our OCR-D Manager module will be started.

The most convenient way is by setting the environment variable `COMPOSE_PROFILES` in the shell.

The default in the Makefile is `COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller`,
i.e. enabling both optional modules. Setting any value in the shell will override that default
when using `make` (and also allow using `docker compose` commands directly without `make`).

The following four possibilities arise:

    export COMPOSE_PROFILES=                       # Running module OCR-D Manager only
    export COMPOSE_PROFILES=with-ocrd-controller   # Running modules OCR-D Manager + OCR-D Controller
    export COMPOSE_PROFILES=with-kitodo-production # Running modules OCR-D Manager + Kitodo.Production
    export COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller # Running all modules

## Using existing OCR-D Controller

Without using the `with-ocrd-controller` profile, you must build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller) _externally and possibly remotely_.

In addition, you _must_ also [configure](#configuration) where the Manager can find that standalone Controller. _For example_, you may want to set:

     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022


Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the private key used by the Manager.

In section [Configuring an external OCR D Controller instance](configure-external.md#Adapting-an-external-Kitodo.Production-instance) of the `Configure External` page
you will find more details.

## Using existing Kitodo.Production

Without using the `with-kitodo-production` profile, you may want to build, configure, start and stop [Kitodo.Production](https://github.com/slub/kitodo-production-docker) _externally and possibly remotely_.

If you _do_ want to connect an external Kitodo with the Manager, you _must_ set up its `OCRD_MANAGER` environment variable, so it can find the Manager over the network, copy the SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager, and copy the scripts under `./kitodo/overwrites/data/scripts/` to the server's `/usr/local/kitodo`.

In section [Adapting an external Kitodo.Production instance](configure-external.md#Adapting-an-external-Kitodo.Production-instance) of the `Configure External` page 
you will find more details.
