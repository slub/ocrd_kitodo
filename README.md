# Kitodo Production using OCR-D

> Docker integration of [Kitodo.Production](https://github.com/kitodo/kitodo-production) and [OCR-D](https://ocr-d.de)

![architecture](https://i.imgur.com/UMiVd3Y.png)
![sharing](https://i.imgur.com/UBu5zVg.png)

 * [Prerequisites](#prerequisites)
 * [Preparation](#preparation)
   * [Prepare keys and examples](#prepare-keys-and-examples)
   * [OCR-D models](#ocr-d-models)
 * [Usage](#usage)
   * [Docker Compose](#docker-compose)
     * [Setup](#setup)
       * [Managed Mode](#managed-mode)
       * [Standalone Mode](#standalone-mode)
     * [Building](#building)
     * [Starting](#starting)
     * [Stopping and removing](#stopping-and-removing)
     * [Stopping](#stopping)
     * [Dumping](#dumping)
     * [Status](#status)
     * [Configuration](#configuration)
   * [Kitodo](#kitodo)
     * [Sample Data](#sample-data)
   * [Monitor](#monitor)
 * [References](#references)

## Prerequisites

### Docker

1. [Install Docker Engine](https://docs.docker.com/get-docker/)
2. [Install Docker Compose](https://docs.docker.com/compose/install/)
3. [Install Nvidia Container Runtime](https://github.com/NVIDIA/nvidia-container-runtime) (needed for Controller – even if no GPU is available)

### Git

Either clone recursively in the first place:

    git clone --recurse-submodules https://github.com/markusweigelt/kitodo_production_ocrd
    cd kitodo_production_ocrd

Or, after cloning and entering the repository normally, clone all submodules:

    git submodule update --init --recursive


## Preparation

Go to the directory where you've checked out the project.

### Prepare keys and examples

Before Docker Compose can be used, you must create directories to mount SSH key pairs
for user authentication to [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
and [OCR-D Manager](https://github.com/markusweigelt/ocrd_manager).

Moreover, for testing we need example data (e.g. users, authorities, workflows etc.) set up in the database of Kitodo.Production.

 Finally, you need to install some OCR models in the Controller with OCR-D Resource Manager.


The fastest way to get all that is by using the Makefile via the following command:

    make prepare

> Note: This may not meet your exact scenario. To customize, have a look at the [rules](./Makefile#L21-L64),
> or simulate running them via `make -n prepare`, or modify the results afterwards.
> (For example, if you have set up the [OCR-D Controller](https://github.com/bertsky/ocrd_controller) _externally_,
> you will have to manually append to its `authorized_keys` the file generated under `./ocrd/manager/.ssh/id_rsa.pub`,
> or copy the existing private key into `./ocrd/manager/.ssh/id_rsa`.)

Alternatively, perform the following steps manually:


- Create directories to host SSH key pair files:

        mkdir ./kitodo/.ssh/
        mkdir ./ocrd/manager/.ssh/
        mkdir ./ocrd/controller/.ssh/

- Generate SSH key pairs in `./kitodo/.ssh/` and `./ocrd/manager/.ssh/`. 
- After that, register the public keys on the other side, respectively:

        mv ./kitodo/.ssh/id_rsa.pub ./ocrd/manager/authorized_keys
        mv ./ocrd/manager/id_rsa.pub ./ocrd/controller/authorized_keys


- Copy contents of `./_resources/kitodo` and `./_resources/kitodo-sample` to folder `./kitodo/overwrites` to provide the examples and Kitodo.Production configuration files.

- Follow the instructions in [the next section](#ocr-d-models) to install OCR models on the Controller.


### OCR-D models

For practical workflows, you first have to install models for various processors on the OCR-D Controller.
Since all processor resources are mounted under the `CONTROLLER_MODELS` volume, resources will persist
and thus only have to be installed once.

Installation could be done by downloading the respective files into the filesystem (see `make prepare`),
or dynamically:

1. Start interactive shell on the Controller.

        docker exec -u ocrd -it kitodo_production_ocrd_ocrd-controller_1 bash

2. Use the OCR-D Resource Manager to query and install models:

        wget -O frak2021.traineddata https://ub-backup.bib.uni-mannheim.de/~stweil/tesstrain/frak2021/tessdata_best/frak2021-0.905.traineddata
        ocrd resmgr download -n ocrd-tesserocr-recognize frak2021.traineddata
        ocrd resmgr download ocrd-eynollah-segment default
        ocrd resmgr list-installed
        ocrd resmgr list-available
        ocrd resmgr --help

## Usage

### Docker Compose

#### Setup

You may want Docker Compose to either
- **manage** the Controller (besides Production and Manager services itself), or
- leave the Controller to be run **standalone** (and merely control Production and Manager here).

##### Managed Mode

This is the default setting in the Makefile, and can be made explicit via

    export MODE=managed

Equivalently, when using `docker-compose` without the Makefile, it is recommended
to export all config files into a variable once
(so you won't have to type `-f docker-compose.kitodo-app.yml` each time):

    export COMPOSE_FILE=docker_compose.yml:docker_compose.managed.yml:docker-compose.kitodo-app.yml

##### Standalone Mode

In this mode, you build, configure, start and stop the [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
_externally (and possibly remotely)_.

When using the Makefile, just set

    export MODE=standalone

in your shell once.

Equivalently, when using `docker-compose` without the Makefile, you should set

    export COMPOSE_FILE=docker_compose.yml:docker-compose.kitodo-app.yml

In addition, you _must_ also [configure](#configuration) where the Manager can find the standalone Controller.
_For example_, you may want to set:

    export MODE=standalone CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022


#### Building

Unless you want to run with prebuilt images from Dockerhub
(in which case make sure you have [configured](#configuration)
the right version tags in your `.env`), you first need to
build Docker images for all modules.

    make build

(or equivalently:)

    docker-compose build

#### Starting

To start containers from images for all services

    make start

(or equivalently:)

    docker-compose up -d


#### Stopping

To stop containers for all services

    make stop

(or equivalently:)

    docker-compose stop


#### Stopping and removing

To stop containers for all services, and then remove the stopped containers as well as any created networks:

    make down

(or equivalently:)

    docker-compose down


#### Dumping

To see the complete configuration for Docker Compose:

    make config

(or equivalently:)

    docker-compose config


#### Status

To get a list of currently running containers:

    make status

(or equivalently:)

    docker-compose ps

#### Configuration

The following variables must be defined.

> **Note**:
> By _default_ this is done in `.env` file (with shell-like syntax).
> But any environment variable settings via shell or `make` call take
> _precedence_ of `.env` configuration.
> So for example, you can `source .env` and then customize the
> default values interactively.
> Alternatively, you can import a customized file, e.g. `source .env.local`.)
>
> **Note**:
> When using the Makefile, some of the static settings in `.env` will always
> be overridden dynamically: To optimally match ownership and permissions of
> existing files with new data to be written, the UID and GID of the `ocrd` user
> on the Controller and Manager are taken from the host system.
>
> **Note**:
> If you do not want to [`make build`](#building) the images yourself, but
> use the _prebuilt_ images from Dockerhub, then mind the image _tag_ variables.
> Instead of the default `latest` development version, you may want to use
> a stable release: Just checkout the respective Git release, and `.env`
> should already point to stable tags.

##### Controller

(only relevant in **managed mode**, see [above](#setup))

| Name | Default | Description
| --- | --- | --- |
| CONTROLLER_IMAGE | bertsky/ocrd_controller:latest | name and tag of image |
| CONTROLLER_HOST | ocrd-controller | name of host |
| CONTROLLER_ENV_UID | 1001 | user id of SSH user (`id -u` when using `make`) |
| CONTROLLER_ENV_GID | 1001 | group id of SSH user (`id -g` when using `make`)  |
| CONTROLLER_ENV_UMASK | 0002 | SSH user specific permission mask |
| CONTROLLER_PORT_SSH | 22 | SSH port to reach |
| CONTROLLER_KEYS | `./ocrd/controller/.ssh/authorized_keys` | file with public SSH keys of users allowed to login from Manager or externally |
| CONTROLLER_DATA | `./kitodo/data/metadata` | data volume to mount |
| CONTROLLER_MODELS | `./ocrd/controller/models` | path to Controller models (in `ocrd-resources/`) |
| CONTROLLER_CONFIG | `./ocrd/controller/config` | path to Controller config (in `ocrd/resources.yml`) |
| CONTROLLER_WORKERS | 1 | count of workers for processing |

##### Manager

| Name | Default | Description
| --- | --- | --- |
| MANAGER_IMAGE | markusweigelt/ocrd_manager:latest | name and tag of image |
| MANAGER_HOST | ocrd-manager | name of host |
| MANAGER_ENV_UID | 1001 | user id of SSH user (`id -u` when using `make`) |
| MANAGER_ENV_GID | 1001 | group id of SSH user (`id -g` when using `make`) |
| MANAGER_ENV_UMASK | 0002 | ssh user specific permission mask |
| MANAGER_KEYS | `./ocrd/manager/.ssh/authorized_keys` | file with public SSH keys of users allowed to login from Kitodo or externally |
| MANAGER_KEY | `./ocrd/manager/.ssh/id_rsa` | file with private SSH key of `ocrd` user for login to local (`managed`) or external Controller |
| MANAGER_DATA | `./kitodo/data/metadata` | data volume to mount |

(It is allowed and realistic if `MANAGER_DATA` is different than `CONTROLLER_DATA`.
 Input/output will be synchronized between them at runtime.)

##### Monitor

| Name | Default | Description
| --- | --- | --- |
| MONITOR_IMAGE | bertsky/ocrd_monitor:latest | name and tag of image |
| MONITOR_HOST | ocrd-monitor | name of host |
| MONITOR_PORT_WEB | 5000 | host-side port to exposed Web server |
| MONITOR_PORT_GTK | 8085 | host-side port to exposed Broadwayd (Gtk Web server) |
| MONITOR_PORT_LOG | 8088 | host-side port to exposed Dozzle (Docker log viewer) |
| MONITOR_DATA | `./kitodo/data/metadata` | data volume to mount |

(Currently, `MONITOR_DATA` should be the same as `MANAGER_DATA`.)

##### Kitodo.Production Application

| Name | Default | Description                                               
| --- | --- | --- |
| APP_IMAGE | markusweigelt/kitodo-production:latest | name and tag of image |
| APP_BUILD_CONTEXT | `./_modules/kitodo-production-docker/kitodo` | directory of Dockerfile |
| APP_BUILDER_GIT_COMMIT | ocrd-main | branch "ocrd-main" of git repository (cause using `git` as `BUILDER_TYPE`) |
| APP_BUILDER_GIT_SOURCE_URL | https://github.com/markusweigelt/kitodo-production/ | repository of BUILDER_GIT_COMMIT (cause using `git` as `BUILDER_TYPE`) |
| APP_DATA | `./kitodo/data` | directory of application data e.g. config and modules |
| APP_KEY | `./kitodo/.ssh/id_rsa` | file with private ssh key of ocrd user to login to Manager |
| APP_PORT | 8080 | port of Kitodo.Production |

##### Database

| Name | Default | Description                                               
| --- | --- | --- |
| DB_IMAGE | mysql:8.0.26 | name and tag of image |
| DB_HOST | kitodo-db | host of database |
| DB_PORT | 3306 | port of database |
| DB_ROOT_PASSWORD | 1234 | root user password |
| DB_NAME | kitodo | name of database used by Kitodo.Productions |
| DB_USER | kitodo | username to access database |
| DB_USER_PASSWORD | kitodo | password used by username to access database |

##### Elastic Search

| Name | Default | Description                                               
| --- | --- | --- |
| ES_IMAGE | docker.elastic.co/elasticsearch/elasticsearch:7.17.3 | name and tag of image |
| ES_HOST | kitodo-es | host of elastic search |
| ES_REST_PORT | 9200 | rest port |
| ES_NODE_PORT | 9300 | node port |

##### Active MQ

| Name | Default | Description                                               
| --- | --- | --- |
| MQ_IMAGE | markusweigelt/activemq:latest | name and tag of image |
| MQ_HOST | kitodo-mq | host of active mq |
| MQ_PORT | 61616 | port of active mq |

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

#### Sample Data

After starting Kitodo, a sample workflow with script tasks for OCR processing from the process directory 
and the Export directory is already configured.

You can find the sample workflow under `Projects` -> `Workflows` -> `OCR_Workflow`.

![image](https://user-images.githubusercontent.com/3832618/196455027-db85f67c-b4b3-4db8-a43a-eac998281a1f.png)

In this workflow, the script tasks `OCR from Process Dir` and `OCR from Export Dir` have been added to trigger OCR processing from Kitodo.
In addition, further settings were made and a sample process was created with this workflow.

##### Execute script task "OCR from Process Dir"

This script task executes the script `script_ocr_process_dir.sh` from the script folder and passes the selected `process id` and the current `task id` as parameters.

To execute this script task, navigate from the dashboard to `All processes` by clicking on the button in processes widget, or use the URL http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0.

Select process to execute script task, and click on `Possible actions` and then on `Execute KitodoScript`.

Type following text in script field:

```
action:runscript "stepname:OCR from Process Dir" "script:OCR Process Dir"
```

... and click on `Execute KitodoScript`.
(This will run the simplistic Tesseract-based default workflow
asynchronously. The process status will change as soon as the job
is finished.)

Watch `docker logs`, or look under the hood with the Monitor.

##### Execute script task "OCR from Export Dir"

This script task executes the script `script_ocr_export_dir.sh` from the script folder and passes the selected `process title` and the current `task id` as parameters.
The automatic script task is bound to the manual task `Export DMS` in the workflow, because it needs the METS from the export folder that is created via the DMS export. 

To export METS of process, navigate from the dashboard to `All processes` by clicking on the button in processes widget, or use the URL http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0.

Select process to export, and click on `Possible actions` and then on `Export DMS`. After a successful export, the METS is located in the export folder `/usr/local/kitodo/dms-export/` in the subfolder with the title of the selected process.

> Note: The export folder can be changed under the project settings and can only be found in our sample project under this path `/usr/local/kitodo/dms-export/`.

After that the status of the task can be set to `Completed` and our script task `OCR from Export Dir` will be executed automatically.

(or equivalently when the METS was exported:)

```
action:runscript "stepname:OCR from Export Dir" "script:OCR Export Dir"
```

> Note: The `script_ocr_export_dir.sh` is work in process and does not perform any processing of the METS atm. It only gives a message with which parameters it was called.

#### More configuration options
- [Using project-specific OCR Workflows in Kitodo.Production](https://github.com/markusweigelt/kitodo_production_ocrd/wiki/Using-project-specific-OCR-Workflows-in-Kitodo.Production)

### Monitor

Provides a simplistic Web interface under http://localhost:5000 for
- browsing workspaces with [OCR-D Browser](https://github.com/hnesk/browse-ocrd) to inspect intermediate/final processing results
- getting statistics of running and terminated jobs
- reading and searching Docker logs

## References

- [OCR-D Controller](https://github.com/bertsky/ocrd_controller)
- [OCR-D Manager](https://github.com/markusweigelt/ocrd_manager)

- [Kitodo.Production](https://github.com/markusweigelt/kitodo-production/tree/ocrd-main)
  - [Dockerfile](https://github.com/markusweigelt/kitodo-production-docker/tree/main/kitodo)
