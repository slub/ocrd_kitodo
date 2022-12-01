Of the 3 main modules integrated here, while the OCR-D Manager is mandatory, 
the OCR-D Controller and Kitodo.Production are optional 
(i.e. the may be run independently/remotely standalone, or not at all).

## Compose profiles

You can tell Docker Compose whether to enable (i.e. start and stop) or disable (i.e. ignore) 
their associated services, simply by selecting **profiles**:

- **`with-ocrd-controller`** profile enables OCR-D Controller service (`ocrd-controller`)
- **`with-kitodo-production`** profile enables all Kitodo.Production services (`kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq`)

Without the use of these profiles, only the services of OCR-D Manager module will be run (`ocrd-manager`, `ocrd-monitor`, `ocrd-logview`).

The most convenient way is by setting the environment variable `COMPOSE_PROFILES` in the shell. 
The **default** in the Makefile is:

    COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller

i.e. both optional modules are enabled. 

Setting any value in the shell will **override** that default
when using `make` (and also allow using `docker compose` commands directly without `make`).

The following four possibilities arise:

    export COMPOSE_PROFILES=                       # Running module OCR-D Manager only
    export COMPOSE_PROFILES=with-ocrd-controller   # Running modules OCR-D Manager + OCR-D Controller
    export COMPOSE_PROFILES=with-kitodo-production # Running modules OCR-D Manager + Kitodo.Production
    export COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller # Running all modules


> **Note**: **Without** the `with-ocrd-controller` profile, you **must** build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller) _externally and possibly remotely_.
> 
> In that case you _must_ [configure](setup/configure-modules.md#ocr-d-controller)
> where the Manager can find that standalone Controller. _For example_, you may want to set:
> 
>     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022
> 
> 
> Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the private key used by the Manager.
> 
> For details, see section [Configuring an external OCR D Controller instance](configure-external.md#configuring-an-external-ocr-d-controller-instance) 
> of the [Configure External](configure-external.md) page.


> **Note**: **Without** the `with-kitodo-production` profile, you **may** want to build, configure, start and stop [Kitodo.Production](https://github.com/slub/kitodo-production-docker) _externally and possibly remotely_.
> 
> In that case you _must_ [configure](setup/configure-modules.md#kitodoproduction)
> its `OCRD_MANAGER` environment variable, so it can find the Manager over the network. For example:
> 
>     export OCRD_MANAGER=ocrd-server:9022 >> ~/.bashrc
> 
> Moreoever, the Manager must have a SSH public key in its `/.ssh/authorized_keys` matching the private key used by Kitodo.Production.
> 
> For details, see section [Adapting an external Kitodo.Production instance](configure-external.md#adapting-an-external-kitodoproduction-instance) 
> of the [Configure External](configure-external.md) page.
