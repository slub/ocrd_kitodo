# Kitodo Production using OCR-D

### Prerequisites

Install Docker Engine
https://docs.docker.com/get-docker/

Install Docker Compose
https://docs.docker.com/compose/install/

Go to the directory where you've put your checkout.

### Usage

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
