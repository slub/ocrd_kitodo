## Configuration

> Without this, you must build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller)
> _externally and possibly remotely_.

> In addition, you _must_ also [configure](#configuration) where the Manager can find
> that standalone Controller. _For example_, you may want to set:
>
>     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022
>

> Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the
> private key used by the Manager.

### Environment Variables

{% include '_includes/modules-configuration-general.md' %}

{% include '_generated/env-controller-table.md' %}

## Installing OCR-D Models

Installation could be done by downloading the respective files into the filesystem (see `make prepare-examples`),
or dynamically via the OCR-D Resource Manager:

1. Start interactive shell on the Controller.  
   If `with-ocrd-controller` is [enabled](#setup), and has been [started](#starting),
   by entering the running container:

        docker exec -u ocrd -it ocrd_kitodo-ocrd-controller-1 bash

   If running an external Controller instance, by logging in remotely:

        ssh -p $CONTROLLER_PORT_SSH ocrd@$CONTROLLER_HOST bash


2. Use the [OCR-D Resource Manager](https://ocr-d.de/en/models) to query and install models:

        ocrd resmgr download ocrd-tesserocr-recognize frak2021.traineddata
        ocrd resmgr download ocrd-eynollah-segment default
        ocrd resmgr list-installed
        ocrd resmgr list-available
        ocrd resmgr --help