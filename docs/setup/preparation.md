# Preparation

Go to the directory where you have checked out the project.

## Prepare keys and Kitodo extensions

Before Docker Compose can be used, you must create directories to mount SSH key pairs
for user authentication to [OCR-D Controller](https://github.com/slub/ocrd_controller) (from Manager)
and [OCR-D Manager](https://github.com/slub/ocrd_manager) (from Kitodo.Production).

Also, you must install some [extensions](#kitodo-extensions) into [Kitodo.Production](https://github.com/slub/kitodo-production-docker).

Moreover, for testing you probably need example data (e.g. users, authorities, workflows etc.) set up in the database of Kitodo.Production.

The simplest way to get all that is by using the Makefile via the following commands:

    make prepare          # generate all required files
    make prepare-keys     # generate only SSH credentials
    make prepare-data     # generate only Kitodo extensions
    make prepare-examples # generate only Kitodo database entries
    make clean            # remove all generated files

> **Note**:
> This may not meet your exact scenario entirely. To customize, have a look at the [rules](./Makefile#L16-L85),
> or simulate running them via `make -n prepare`, or modify the results afterwards.
> (For example, if you have [set up](#with-ocrd-controller) the OCR-D Controller _externally_,
> you will have to manually append to its `authorized_keys` the file generated under `./ocrd/manager/.ssh/id_rsa.pub`,
> or copy the existing private key into `./ocrd/manager/.ssh/id_rsa`.
> Running the recipe will merely print instructions to do so.)

Alternatively, perform the following steps manually:


- Create directories to host SSH key pair files:

        mkdir ./kitodo/.ssh/
        mkdir ./ocrd/manager/.ssh/
        mkdir ./ocrd/controller/.ssh/

- Generate SSH key pairs in `./kitodo/.ssh/` and `./ocrd/manager/.ssh/`.
- After that, register the public keys on the other side, respectively:

        mv ./kitodo/.ssh/id_rsa.pub ./ocrd/manager/authorized_keys
        mv ./ocrd/manager/id_rsa.pub ./ocrd/controller/authorized_keys


- Copy contents of `./_resources/kitodo` and `./_resources/kitodo-sample` to the directory `./kitodo/overwrites` to provide the examples and Kitodo.Production configuration files.

## Installation of OCR-D models to OCR-D Controller

For practical workflows, you first have to install models for various processors on the OCR-D Controller.

Please follow the section [Installing OCR-D Models](../modules/ocrd-controller.md#installing-ocr-d-models) of OCR-D Controller module documentation.