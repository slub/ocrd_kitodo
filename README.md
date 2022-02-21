# Kitodo Production using OCR-D

### Prerequisites

Install Docker Engine
https://docs.docker.com/get-docker/

Install Docker Compose
https://docs.docker.com/compose/install/

Go to the directory where you've put docker-compose.yml.

### Configure for SSH 

Before docker compose can be started, you must create an SSH key pair for user authentication.

Adapt the following paths to your location of the respective key.

#### Public Key
```
./ocrd/controller/.ssh/authorized_keys
```

#### Private Key
```
./ocrd/manager/.ssh/id_rsa
```

### Starting 
```
docker-compose up -d
```

### Stopping 
```
docker-compose stop
```

### View Logs 
```
docker-compose logs -f
```
