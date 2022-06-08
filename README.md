# Kitodo Production using OCR-D

 * [Prerequisites](#prerequisites)
 * [Setup](#setup)
   * [Credentials and test database](#credentials-and-test-database)
   * [OCR-D models](#ocr-d-models)
 * [Usage](#usage)
   * [Docker Compose](#docker-compose)
     * [Preparation](#preparation)
     * [Starting](#starting)
     * [Stopping and removing](#stopping-and-removing)
     * [Stopping](#stopping)
     * [Dumping](#dumping)
     * [Status](#status)
     * [Configuration](#configuration)
   * [Kitodo](#kitodo)
     * [Execute OCR script step](#execute-ocr-script-step)
 * [References](#references)

## Prerequisites

### Docker

Install Docker Engine
https://docs.docker.com/get-docker/

Install Docker Compose
https://docs.docker.com/compose/install/

### Git

Either clone recursively in the first place:

    git clone --recurse-submodules https://github.com/markusweigelt/kitodo_production_ocrd
    cd kitodo_production_ocrd

Or, after cloning and entering the repository normally, clone all submodules:

    git submodule update --init --recursive


## Setup

### Credentials and test database

Go to the directory where you've put your checkout.

Before Docker Compose can be started, you must create directories to mount an SSH key pair for user authentication to OCR-D Controller and OCR-D Manager.

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

#### Preparation

Unless you want to use `make` below, export all config files into a variable,
so you won't have to type them each time:

    export COMPOSE_FILE=docker_compose.yml:docker_compose.managed.yml:docker-compose.kitodo-app.yml:docker-compose.kitodo-app.override.yml

Or, if you have started the [OCR-D Controller](https://github.com/bertsky/ocrd_controller) externally already:

    export COMPOSE_FILE=docker_compose.yml:docker-compose.kitodo-app.yml:docker-compose.kitodo-app.override.yml


Otherwise (when using the Makefile), just set your mode of operation:

    export MODE=managed

Or, if you have started the [OCR-D Controller](https://github.com/bertsky/ocrd_controller) externally already:

    export MODE=standalone

#### Starting

    docker-compose up --build -d

(or equivalently:)

    make start

#### Stopping and removing

Removes the stopped containers as well as any created networks.

    docker-compose down

(or equivalently:)

    make down

#### Stopping

    docker-compose stop

(or equivalently:)

    make stop

#### Dumping

    docker-compose config

(or equivalently:)

    make config

#### Status

    docker-compose ps

(or equivalently:)

    make status

#### Configuration

The following environment variables must be defined.
(This can also be done in a `.env` file, syntax is shell-like.)

##### Controller

(only relevant in `managed` mode)

| Name | Default | Description
| --- | --- | --- |
| CONTROLLER_IMAGE | bertsky/ocrd_controller | name of image |
| CONTROLLER_IMAGE_TAG | latest | tag name of image |
| CONTROLLER_HOST | ocrd-controller | name of host |
| CONTROLLER_ENV_UID | 1001 | user id of ssh user |
| CONTROLLER_ENV_GID | 1001 | group id of ssh user  |
| CONTROLLER_ENV_UMASK | 0002 | "ssh user specific permission mask |
| CONTROLLER_PORT_SSH | 8022 | host-side port to exposed SSH server of container |
| CONTROLLER_DATA | ./kitodo/config_modules/metadata | data volume to mount |

##### Manager
| Name | Default | Description
| --- | --- | --- |
| MANAGER_IMAGE | markusweigelt/ocrd_manager | name of image  |
| MANAGER_IMAGE_TAG | latest | tag name of image |
| MANAGER_HOST | ocrd-manager | name of host |
| MANAGER_ENV_UID | 1001 | user id of ssh user |
| MANAGER_ENV_GID | 1001 | group id of ssh user |
| MANAGER_ENV_UMASK | 0002 | ssh user specific permission mask |
| MANAGER_PORT_SSH | 9022 | host-side port to exposed SSH server of container |
| MANAGER_DATA | ./kitodo/config_modules/metadata | data volume to mount |

(It is allowed and realistic if `MANAGER_DATA` is different than `CONTROLLER_DATA`.)

##### Monitor

| Name | Default | Description
| --- | --- | --- |
| MONITOR_IMAGE | bertsky/ocrd_monitor | name of image |
| MONITOR_HOST | ocrd-monitor | name of host |
| MONITOR_PORT_WEB | 5000 | host-side port to exposed Web server of container |
| MONITOR_PORT_GTK | 8085 | host-side port to exposed Broadwayd of container |
| MONITOR_DATA | ./kitodo/config_modules/metadata | data volume to mount |

(Currently, `MONITOR_DATA` should be the same as `MANAGER_DATA`.)

##### Use stable environment file

Docker Compose uses the `.env` file as default and thus the latest state of development.
If you want to use a more stable state, use `.env.stable` as environment file.
To accomplish this, either add `--env-file .env.stable` to the `docker-compose` call,
or symlink it to `.env`.

    docker-compose --env-file .env.stable up -d


##### Overwrite environment variables

To optimally match ownership and permissions of existing files with data to be written,
the UID and GID of the Controller and Manager in our Makefile are taken from the host system.
Shell environment variables take precedence over `.env` file variables in Docker Compose.
For example:

    export CONTROLLER_ENV_UID=$(shell id -u) CONTROLLER_HOST=ocrserver
    docker-compose up -d


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

... and click on "Execute KitodoScript".
(This will run the simplistic Tesseract-based default workflow
asynchronously. The process status will change as soon as the job
is finished.)

Watch `docker logs`, or browse to `$MONITOR_HOST:5000` to look under the hood.

## References

- [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
- [OCR-D Manager](https://github.com/markusweigelt/ocrd_manager)

- [Kitodo.Production](https://hub.docker.com/r/markusweigelt/kitodo-production)
  - [Dockerfile](https://github.com/markusweigelt/kitodo-production-docker/tree/main/docker-image)
