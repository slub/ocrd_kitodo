This page describes the configuration of an external OCR-D controller and Kitodo.Production.
If do **not** wish to run the built-in OCR-D Controller and/or Kitodo.Production module read the appropriate sections.
Otherwise you can skip this page and continue with [Preparation](preparation.md).

## Configuring an external OCR-D Controller instance

If you do **not** wish to run the built-in [OCR-D Controller](https://github.com/slub/ocrd_controller) instance (by omitting `with-ocrd-controller` in `$COMPOSE_PROFILES`), you may instead want to set up an **external** OCR-D Controller server to interoperate with the OCR-D Manager. This is how.

### Prerequisites

#### repo

First, check out the Controller. Either
- `cd _modules/ocrd_controller` (if you already have checked out ocrd_kitodo on that machine), or
- `git clone https://github.com/slub/ocrd_controller && cd ocrd_controller` (otherwise)

#### credentials

You will also need the public SSH key file for login from the Manager to the Controller,
created on the ocrd_kitodo host via `make prepare-keys` under `ocrd/controller/.ssh/authorized_keys`
ready on this machine.

### Setup

There are multiple scenarios:

#### Docker, running manually via make

Following the [standalone documentation](https://github.com/slub/ocrd_controller#starting-and-mounting),
choose your parameter values (persistent storage, key, CPUs, SSH port) and **make run**.

For example:

    export DATA=/mnt/workspaces
    export MODELS=~/.local/share
    export CONFIG=~/.config/share
    export KEYS=authorized_keys
    export WORKERS=2
    export PORT=8022
    make run

#### Docker, running manually via Docker Compose

Mimicking the Docker Compose / `.env` approach from the top-level repo,
choose your parameter values (persistent storage, key, CPUs, SSH port) and **docker compose up**.

For example:

    echo "CONTROLLER_IMAGE=ghcr.io/slub/ocrd_controller:latest" > .env
    echo "CONTROLLER_HOST=ocrd-server" >> .env
    echo "CONTROLLER_ENV_UID=$(id -u)" >> .env
    echo "CONTROLLER_ENV_GID=$(id -g)" >> .env
    echo "CONTROLLER_ENV_UMASK=0002"   >> .env
    echo "CONTROLLER_WORKERS=2"        >> .env
    echo "CONTROLLER_KEYS=authorized_keys" >> .env
    echo "CONTROLLER_DATA=/mnt/workspaces" >> .env
    echo "CONTROLLER_MODELS=~/.local/share" >> .env
    echo "CONTROLLER_CONFIG=~/.config/share" >> .env
    docker compose up -d

#### Docker, running via systemctl

Choose your parameter values (persistent storage, key, CPUs, SSH port)
and create a persistent system service.

For example:

```ini
[Unit]
Description = Service with SSH 8022 server for OCR-D processing
After = network.target

[Service]
TimeoutStartSec=0
ExecStartPre=-/usr/bin/docker stop %n
ExecStartPre=-/usr/bin/docker rm %n
ExecStart=docker run --restart=unless-stopped -p 8022:22 --name %n -h %n \
	  -v /mnt/workspaces/:/data \
	  -v /home/you/.local/share:/models \
	  -v /home/you/.config/share:/config \
	  --mount type=bind,source=/home/you/ocrd_controller/authorized_keys,target=/authorized_keys \
	  --tmpfs /tmp:rw,noexec,nosuid,nodev,size=2g \
	  -e UID=1003 -e GID=100 -e UMASK=0002 -e WORKERS=2 \
	  --cpus=2 --gpus=all ghcr.io/slub/ocrd_controller
Restart=always
RestartSec=5

[Install]
WantedBy = multi-user.target
```

Place that under `/etc/systemd/system/ocrd_controller.service` (or similar),
then (once) do `sudo systemctl daemon-reload`,
followed by `sudo systemctl start ocrd_controller.service`.

(This service will go up with the next boot automatically.)

#### native ocrd_all and SSH server installation

Obviously, if you already have a native installation of [ocrd_all](https://github.com/OCR-D/ocrd_all/),
which you also want to use (and maintain) directly, then you don't need Docker to run the Controller
as an SSH server on top of it.

(In the following, let's assume you'll also want to re-use the normal system-wide SSH service
for your normal users.)

Install an SSH server:

    sudo apt-get update
    sudo apt-get install wget git openssh-server rsyslog rsync

Create a Unix users `ocrd` (for processing) and `admin` (for job monitoring),
hooking into your ocrd_all venv and adding a `$WORKERS` login semaphore at login time,
and register the key file with them:

    sudo su
    useradd -s /bin/bash -c "SSH OCR user" ocrd
    useradd -s /bin/bash -c "SSH control user" -u $(id -u ocrd) -g $(id -g ocrd) -M -d /home/ocrd admin
    cd /home/ocrd
    mkdir -p .parallel .ssh
    touch .hushlogin
    echo ". /path/to/your/ocrd_all/venv/bin/activate" >> .bashrc
    echo "umask 0002" >> .bashrc
    echo "cd /mnt/workspaces" >> .bashrc
    cp /path/to/your/authorized_keys .ssh
    # "admin" can always login, but "ocrd" may have to wait:
    echo 'test x$USER != xocrd && exit' >> .ssh/rc
    # determine the parent shell session
    echo 'parent=$(cat /proc/$PPID/stat | cut -d\  -f4)' >> .ssh/rc
    echo "workers=${WORKERS:-1}" >> .ssh/rc
    # enter semaphore during login
    echo 'sem --will-cite -j $workers --bg --id ocrd_controller_job tail --pid $parent -f /dev/null' >> .ssh/rc
    chmod go-rwx .ssh/*
    chown -R ocrd:ocrd /home/ocrd

Now, simply do:

    sudo service ssh start

### Connect from ocrd_kitodo

After you have set up the external OCR-D Controller instance,
you need to configure your OCR-D Manager for the connection.
You can either customize its `.env` file, or simply export the
respective environment variables on the shell (which will
override the .env settings).

For example:

    export CONTROLLER_HOST=ocrserver # remote address
    export CONTROLLER_PORT_SSH=8022 # or 22 for native SSH


## Adapting an external Kitodo.Production instance

If do **not** wish to run the built-in [Kitodo.Production container](https://github.com/slub/kitodo-production-docker) instance (by omitting `with-kitodo-production` in `$COMPOSE_PROFILES`), you may instead want to set up an **external** Kitodo.Production server to interoperate with the OCR-D Manager. This is how.

You may not need all [OCR-D specific extensions](https://github.com/markusweigelt/kitodo-production/tree/ocrd-main) ([currently](https://github.com/slub/kitodo-production-docker/tree/b993910fc29588d03189ff3c5ab9bf951a023984), only a new tab in the project tab for configuring OCR workflow files).

At the very least, you must [install](https://github.com/slub/kitodo-production-docker/blob/e4bb52c10f64bb4a61e97b0aa402a6b428359b2c/startup.sh#L58) the [actual scripts](https://github.com/slub/ocrd_kitodo/tree/main/_resources/kitodo/data/scripts) for OCR-D specific OCR script tasks, and some SSH keys.

If you just run…

    make prepare

…you will also be instructed to do so.

<details><summary>see output</summary>
<p>

```sh
mkdir -p kitodo/.ssh/
ssh-keygen -t rsa -q -f kitodo/.ssh/id_rsa -P '' -C 'Kitodo.Production key'
	You should now install the private key kitodo/.ssh/id_rsa
	to your own Kitodo.Production instance,
	or conversely, install the existing public key ~/.ssh/id_rsa.pub
	of your own Kitodo.Production instance
	to ./ocrd/manager/.ssh/authorized_keys.
mkdir -p ocrd/manager/.ssh/
cp kitodo/.ssh/id_rsa.pub ocrd/manager/.ssh/authorized_keys
ssh-keygen -t rsa -q -f ocrd/manager/.ssh/id_rsa -P '' -C 'OCR-D manager key'
mkdir -p ocrd/controller/.ssh/
cp ocrd/manager/.ssh/id_rsa.pub ocrd/controller/.ssh/authorized_keys
mkdir -p kitodo/data/metadata/
mkdir -p kitodo/overwrites/
cp -r ./_resources/kitodo/data kitodo/overwrites/data
mkdir -p kitodo/overwrites/data/ocr_workflows/
cp ./_modules/ocrd_manager/ocr-workflow-default.sh kitodo/overwrites/data/ocr_workflows/
	You should now copy kitodo/overwrites/data/scripts
	to your own Kitodo.Production instance
	(typically under /usr/local/kitodo).
```

</p></details>

For example (assuming your Kitodo instance's local username is `tomcat`):

    scp -r kitodo/overwrites/data/scripts tomcat@kitodo-server:/usr/local/kitodo
    scp tomcat@kitodo-server:.ssh/id_rsa.pub ocrd/manager/.ssh/authorized_keys

These scripts make reference to the `$OCRD_MANAGER` variable, which points to the OCR-D Manager instance (address:port). Make sure you export/set this variable appropriately for the Kitodo instance. For example:

    echo 'export OCRD_MANAGER=ocrd-server:9022 >> ~/.bashrc' | ssh tomcat@kitodo-server

Then restart the Kitodo.Production server.