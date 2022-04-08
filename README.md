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

#### Enviroment Variables 

##### Controller
| Name | Default | Description
| --- | --- | --- |
| CONTROLLER_IMAGE | bertsky/ocrd_controller | name of image |
| CONTROLLER_IMAGE_TAG | latest | tag name of image |
| CONTROLLER_HOST | ocrd-controller | name of host |
| CONTROLLER_ENV_UID | 1001 | user id of ssh user |
| CONTROLLER_ENV_GID | 1001 | group id of ssh user  |
| CONTROLLER_ENV_UMASK | 0002 | "ssh user specific permission mask |
| CONTROLLER_PORT_SSH | 8022 | Host machine port to exposed ssh port of container |

##### Manager
| Name | Default | Description
| --- | --- | --- |
| MANAGER_IMAGE | markusweigelt/ocrd_manager | name of image  |
| MANAGER_IMAGE_TAG | latest | tag name of image |
| MANAGER_HOST | ocrd-manager | name of host |
| MANAGER_ENV_UID | 1001 | user id of ssh user |
| MANAGER_ENV_GID | 1001 | group id of ssh user |
| MANAGER_ENV_UMASK | 0002 | ssh user specific permission mask |
| MANAGER_PORT_SSH | 9022 | host machine port to exposed ssh port of container |

#### Starting

    docker-compose -f docker-compose.yml -f docker-compose-controller.yml up -d

(or equivalently:)

    make start

##### Stable state
   
Docker compose uses the .env file as default and thus the latest state of development. If you want to use a more stable state, use .env.stable as the environment file. To accomplish this, add the following parameter "--env-file" with the value ".env.stable" to the docker-compose call.

```
  docker-compose --env-file .env.stable -f docker-compose.yml -f docker-compose-controller.yml up -d
```
        
#### Stopping OCR-D and Kitodo

    docker-compose -f docker-compose.yml -f docker-compose-controller.yml stop

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
  - [Dockerfile](https://github.com/markusweigelt/kitodo-production-docker/tree/main/docker-image)
