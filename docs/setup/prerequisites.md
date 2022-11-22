## Install necessary tools

1. [Install Docker Engine](https://docs.docker.com/get-docker/) (`docker-ce`)
2. [Install Docker Compose](https://docs.docker.com/compose/install/) (`docker-compose-plugin` – needed for `docker compose` replacing `docker-compose`)
3. [Install Nvidia Container Runtime](https://github.com/NVIDIA/nvidia-container-runtime) (`nvidia-container-toolkit` – needed for Controller, even if no GPU is available)
4. Install `git` 
5. (optionally) Install `make`

## Clone repository and initialize submodules

Either clone recursively in the first place:

    git clone --recurse-submodules https://github.com/slub/ocrd_kitodo
    cd ocrd_kitodo

Or, after cloning and entering the repository normally, clone all submodules:

    git submodule update --init --recursive
