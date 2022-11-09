> Without this, you must build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller)
> _externally and possibly remotely_.

> In addition, you _must_ also [configure](#configuration) where the Manager can find
> that standalone Controller. _For example_, you may want to set:
>
>     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022
>

> Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the
> private key used by the Manager.

## Configuration

{% include '_generated/env-controller-table.md' %}