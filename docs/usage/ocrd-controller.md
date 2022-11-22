## Installation of OCR-D models

Since all processor resources are mounted under the `CONTROLLER_MODELS` volume, resources will persist
and thus only have to be downloaded once.

Installation could be done by downloading the respective files into the filesystem (see `make prepare-examples`),
or dynamically via the OCR-D Resource Manager:

1. Start interactive shell on the Controller.  
   If `with-ocrd-controller` is [enabled](../setup/enable-disable-modules.md), and has been [started](../setup/running.md#starting),
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
