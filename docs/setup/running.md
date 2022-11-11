## Building

If you want to run with prebuilt images from Github Container Registry
(in which case make sure you have [configured](#configuration)
the right image version tags in your `.env`), you can **skip** this step.

Otherwise, to build Docker images for all modules, do:

    make build

(or equivalently:)

    docker compose build

## Starting

To start containers from images for all services:

    make start

(or equivalently:)

    docker compose up -d


## Stopping

To stop containers for all services:

    make stop

(or equivalently:)

    docker compose stop


## Stopping and removing

To stop containers for all services, and then remove the stopped containers
as well as any created networks, do:

    make down

(or equivalently:)

    docker compose down


## Dumping

To see the complete configuration for Docker Compose, do:

    make config

(or equivalently:)

    docker compose config


## Status

To get a list of currently running containers, do:

    make status

(or equivalently:)

    docker compose ps

## Testing

To download some testdata and process them on the Manager
(which must already be running, and must be able to connect to the Controller), do:

    make test-production   # test for_production.sh (images→ALTO-XML)
    make test-presentation # test for_presentation.sh (METS→METS)
    make test              # run both
    make clean-testdata    # remove the test data and test results