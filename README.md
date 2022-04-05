# Kitodo Production using OCR-D

 * [Prerequisites](#prerequisites)
 * [Setup](#setup)
 * [Usage](#usage)
   * [Docker Compose](#docker-compose)
   * [Kitodo](#kitodo)
 * [Futher informations and repositories](#futher-informations-and-repositories)

## Prerequisites

Install Docker Engine
https://docs.docker.com/get-docker/

Install Docker Compose
https://docs.docker.com/compose/install/

## Setup

### Credentials and test database

Go to the directory where you've put your checkout.

Before docker compose can be started, you must create directories to mount an SSH key pair for user authentication to OCR-D Controller and OCR-D Manager.

The fastest way is to use the makefile via the following command:

    make build

After this step, [start OCR-D and Kitodo](#starting-ocr-d-and-kitodo) and install a first model in the OCR-D controller.

### OCR-D models

For practical workflows, you first have to install models into the OCR-D controller.
This could be done persistently via the filesystem, or dynamically:

1. Start interactive shell of controller.

        docker exec -it CONTROLLER_CONTAINER_NAME /bin/bash

2. Running following commands to download and install model.

        wget -O frak2021.traineddata https://ub-backup.bib.uni-mannheim.de/~stweil/tesstrain/frak2021/tessdata_best/frak2021-0.905.traineddata
        ocrd resmgr download -n ocrd-tesserocr-recognize frak2021.traineddata

## Usage

### Docker Compose

#### Starting


    docker-compose -f docker-compose.yml -f docker-compose-kitodo.yml up -d


(or equivalently:)

    make start

#### Stopping OCR-D and Kitodo

    docker-compose -f docker-compose.yml -f docker-compose-kitodo.yml stop

(or equivalently:)

    make stop

### Kitodo

Open your browser and navigate to http://localhost:8080/kitodo after OCR-D and Kitodo are started.

Enter the user name "testadmin" and the password "test" in the login dialog.

*If it is the first launch of Kitodo.Production then the "Indexing" tab of the system page is displayed cause indexing still needs to be done. To perform the indexing click on the button "Create ElasticSearch mapping". After the mapping is created click on the button "Start indexing" next to "Whole index" label. After a few seconds the index is created and you can navigate to the dashboard by clicking on the Kitodo.Production logo.*


#### Execute OCR script step

From dashboard navigate to "All processes" by clicking on the button in processes widget on dashboard or use following url "http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0".

Select process for ocr and click on "Possible actions" and then on "Execute KitodoScript".

Type following text in script field:

```
action:runscript stepname:OCR script:OCR
```

... and click on "Execute KitodoScript"

## References

- [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
- [OCR-D Manager](https://github.com/markusweigelt/ocrd_manager)

- [Kitodo.Production](https://hub.docker.com/r/markusweigelt/kitodo-production)
  - [Dockerfile](https://github.com/markusweigelt/kitodo-production-docker)
