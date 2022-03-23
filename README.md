# Kitodo Production using OCR-D

## Prerequisites

Install Docker Engine
https://docs.docker.com/get-docker/

Install Docker Compose
https://docs.docker.com/compose/install/

Go to the directory where you've put your checkout.

## Usage

Before docker compose can be started, you must create directories to mount an SSH key pair for user authentication to OCR-D Controller and OCR-D Manager.

The fastest way is to use the make file and the following command:

```
make build
```

### Starting OCR-D and Kitodo

```
docker-compose -f docker-compose.yml -f docker-compose-kitodo.yml up -d
```

### Stopping 
```
docker-compose -f docker-compose.yml -f docker-compose-kitodo.yml stop
```

## Kitodo

Open your browser and navigate to http://localhost:8080/kitodo after OCR-D and Kitodo are started.

Enter the user name "testadmin" and the password "test" in the login dialog.

### Execute OCR script step

Navigate to "All processes" by clicking on the button in processes widget on dashboard or use following url "http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0".

Select process for ocr and click on "Possible actions" and then on "Execute KitodoScript".

Type following text in script field "action:runscript stepname:OCR script:OCR" and click on "Execute KitodoScript"

## Futher informations and repositories

- OCR-D Controller https://github.com/bertsky/ocrd_controller
- OCR-D Manager https://github.com/markusweigelt/ocrd_manager
- Kitodo Docker Image https://github.com/markusweigelt/kitodo-contrib/tree/master/slub/docker/docker-image
