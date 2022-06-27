# Kitodo Production using OCR-D

> Docker integration of [Kitodo.Production](https://github.com/kitodo/kitodo-production) and [OCR-D](https://ocr-d.de)

![architecture](https://i.imgur.com/UMiVd3Y.png)
![sharing](https://i.imgur.com/UBu5zVg.png)

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

Go to the directory where you've checked out the project.

Before Docker Compose can be started, you must create directories to mount an SSH key pair
for user authentication to [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
and [OCR-D Manager](https://github.com/markusweigelt/ocrd_manager).

Also, the [Kitodo application](https://github.com/markusweigelt/kitodo-production-docker/tree/main/docker-image)
must be built from source as a Docker image. For testing, is helps to have existing
example users and processes set up in the database.

The fastest way to get all that is by using the makefile via the following command:

    make build

After this step, [start OCR-D and Kitodo](#starting-ocr-d-and-kitodo) and install a first model in the OCR-D controller:

### OCR-D models

For practical workflows, you first have to install models into the OCR-D Controller.
This could be done persistently via the filesystem (under the `CONTROLLER_MODELS` volume), or dynamically:

1. Start interactive shell of controller.

        docker exec -it kitodo_production_ocrd_ocrd-controller_1 bash

2. Running following commands to download and install model.

        wget -O frak2021.traineddata https://ub-backup.bib.uni-mannheim.de/~stweil/tesstrain/frak2021/tessdata_best/frak2021-0.905.traineddata
        ocrd resmgr download -n ocrd-tesserocr-recognize frak2021.traineddata

## Usage

### Docker Compose

#### Preparation

_Unless_ you want to use `make` below, export all config files into a variable,
so you won't have to type them each time:

    export COMPOSE_FILE=docker_compose.yml:docker_compose.managed.yml:docker-compose.kitodo-app.yml

Or, if you have started the [OCR-D Controller](https://github.com/bertsky/ocrd_controller) _externally_ already:

    export COMPOSE_FILE=docker_compose.yml:docker-compose.kitodo-app.yml


_Otherwise_ (when using the Makefile), just set your mode of operation:

    export MODE=managed

Or, if you have started the [OCR-D Controller](https://github.com/bertsky/ocrd_controller) _externally_ already:

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

> Note: This can also be done in a `.env` file, syntax is shell-like.
> The file configuration will still be dynamically overridden
> by any variable settings via shell or `make` call.
> So for example, you can `source .env` and then customize the
> default values interactively. 
> Or instead you can import a customized file, e.g. `source .env.local`.)

##### Controller

(only relevant in `managed` mode)

| Name | Default | Description
| --- | --- | --- |
| CONTROLLER_IMAGE | bertsky/ocrd_controller | name and tag of image |
| CONTROLLER_HOST | ocrd-controller | name of host |
| CONTROLLER_ENV_UID | 1001 | user id of SSH user |
| CONTROLLER_ENV_GID | 1001 | group id of SSH user  |
| CONTROLLER_ENV_UMASK | 0002 | SSH user specific permission mask |
| CONTROLLER_PORT_SSH | 8022 | host-side port to exposed SSH server of container |
| CONTROLLER_KEYS | `./ocrd/controller/.ssh/authorized_keys` | file with public SSH keys of users allowed to login from Manager or externally |
| CONTROLLER_DATA | `./kitodo/data/metadata` | data volume to mount |
| CONTROLLER_MODELS | `./ocrd/controller/models` | path to Controller models (in `ocrd-resources/`) |
| CONTROLLER_CONFIG | `./ocrd/controller/config` | path to Controller config (in `ocrd/resources.yml`) |
| CONTROLLER_WORKERS | 1 | count of workers for processing |

##### Manager

| Name | Default | Description
| --- | --- | --- |
| MANAGER_IMAGE | markusweigelt/ocrd_manager | name of image  |
| MANAGER_IMAGE_TAG | latest | tag name of image |
| MANAGER_HOST | ocrd-manager | name of host |
| MANAGER_ENV_UID | 1001 | user id of SSH user |
| MANAGER_ENV_GID | 1001 | group id of SSH user |
| MANAGER_ENV_UMASK | 0002 | ssh user specific permission mask |
| MANAGER_PORT_SSH | 9022 | host-side port to exposed SSH server of container |
| MANAGER_KEYS | `./ocrd/manager/.ssh/authorized_keys` | file with public SSH keys of users allowed to login from Kitodo or externally |
| MANAGER_KEY | `./ocrd/manager/.ssh/id_rsa` | file with private SSH key of `ocrd` user for login to local (`managed`) or external Controller |
| MANAGER_DATA | `./kitodo/data/metadata` | data volume to mount |

(It is allowed and realistic if `MANAGER_DATA` is different than `CONTROLLER_DATA`.)

##### Monitor

| Name | Default | Description
| --- | --- | --- |
| MONITOR_IMAGE | bertsky/ocrd_monitor | name of image |
| MONITOR_HOST | ocrd-monitor | name of host |
| MONITOR_PORT_WEB | 5000 | host-side port to exposed Web server of container |
| MONITOR_PORT_GTK | 8085 | host-side port to exposed Broadwayd of container |
| MONITOR_DATA | `./kitodo/data/metadata` | data volume to mount |

(Currently, `MONITOR_DATA` should be the same as `MANAGER_DATA`.)

##### Kitodo Resource Builder

| Name | Default | Description
| --- | --- | --- |
| BUILDER_TYPE | GIT | name of image |
| BUILDER_GIT_COMMIT | ocrd-main | branch "ocrd-main" of git repository |
| BUILDER_GIT_SOURCE_URL | https://github.com/markusweigelt/kitodo-production/ | repository of BUILDER_GIT_COMMIT |
| BUILDER_BUILD_RESOURCES | `./_modules/kitodo-production-docker/kitodo/build-resources` | directory path to resources for building Kitodo.Production image |

##### Kitodo Application

| Name | Default | Description
| --- | --- | --- |
| APP_BUILD_CONTEXT | `./_modules/kitodo-production-docker/kitodo` | directory of Dockerfile |
| APP_BUILD_RESOURCES | `./_modules/kitodo-production-docker/kitodo` | directory of build resources |
| APP_DATA | `./kitodo/data` | directory of application data e.g. config and modules |
| APP_KEY | `./kitodo/.ssh/id_rsa` | file with private ssh key of ocrd user to login to Manager |
| APP_PORT | 8080 | port of Kitodo.Production |

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

    export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=22
    docker-compose up -d


### Kitodo

Open your browser and navigate to http://localhost:8080/kitodo after OCR-D and Kitodo are started.

Enter the user name `testadmin` and the password `test` in the login dialog.

> Note: If it is the first launch of Kitodo.Production, 
> then the `Indexing` tab of the system page is displayed,
> because indexing still needs to be done. 
> To perform the indexing, click on the button `Create ElasticSearch mapping`.
> After the mapping is created, click on the button `Start indexing` next to
> the `Whole index` label. After a few seconds, the index is created and you
> can navigate to the dashboard by clicking on the Kitodo.Production logo.


#### Execute OCR script step

From the dashboard, navigate to `All processes` by clicking on the button in processes widget,
or use the URL http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0.

Select process for OCR, and click on `Possible actions` and then on `Execute KitodoScript`.

Type following text in script field:

```
action:runscript stepname:OCR script:OCR
```

... and click on `Execute KitodoScript`.
(This will run the simplistic Tesseract-based default workflow
asynchronously. The process status will change as soon as the job
is finished.)

Watch `docker logs`, or browse to http://localhost:5000 to look under the hood with the Monitor.

## References

- [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
- [OCR-D Manager](https://github.com/markusweigelt/ocrd_manager)

- [Kitodo.Production](https://hub.docker.com/r/markusweigelt/kitodo-production)
  - [Dockerfile](https://github.com/markusweigelt/kitodo-production-docker/tree/main/docker-image)
