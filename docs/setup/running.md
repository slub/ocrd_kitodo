After preparing your environment, here is a set of commands for starting, stopping and building the modules, among others.

The easiest and recommended way is to use `make`.

Alternatively, we have listed the equivalent Docker Compose commands here. Make sure that the necessary modules are enabled via the [Compose profiles](enable-disable-modules.md#compose-profiles).

## Building

If you want to run with prebuilt images from GitHub Container Registry
(in which case make sure you have [configured](configure-modules.md)
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
