Of the 3 main modules integrated here, while the OCR-D Manager is mandatory, the others are optional:

- OCR-D Controller (may be run independently/remotely standalone)
- Kitodo.Production (may be run independently/remotely standalone, or not at all)

You can tell Docker Compose whether to enable (i.e. start and stop) or disable (i.e. ignore)
their associated services, simply by selecting **profiles**.

The most convenient way is by setting the environment variable `COMPOSE_PROFILES` in the shell.

The default in the Makefile is `COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller`,
i.e. enabling both optional modules. Setting any value in the shell will override that default
when using `make` (and also allow using `docker compose` commands directly without `make`):

    export COMPOSE_PROFILES=                       # Running module OCR-D Manager only
    export COMPOSE_PROFILES=with-ocrd-controller   # Running modules OCR-D Manager + OCR-D Controller
    export COMPOSE_PROFILES=with-kitodo-production # Running modules OCR-D Manager + Kitodo.Production
    export COMPOSE_PROFILES=with-kitodo-production,with-ocrd-controller # Running all modules 



## with-ocrd-controller

Enables the `ocrd-controller` service.

> **Without** this, you must build, configure, start and stop the [OCR-D Controller](https://github.com/slub/ocrd_controller)
> _externally and possibly remotely_.
>
> In addition, you _must_ also [configure](#configuration) where the Manager can find
> that standalone Controller. _For example_, you may want to set:
>
>     export CONTROLLER_ENV_UID=$(id -u) CONTROLLER_HOST=ocrserver CONTROLLER_PORT_SSH=8022
>
>
> Moreover, the Controller must have a SSH public key in its `/.ssh/authorized_keys` matching the
> private key used by the Manager.

## with-kitodo-production

Enables the `kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq` services.

> **Without** this, you may want to build, configure, start and stop
> [Kitodo.Production](https://github.com/slub/kitodo-production-docker)
> _externally and possibly remotely_.
>
> If you _do_ want to connect an external Kitodo with the Manager, you _must_
> set up its `OCRD_MANAGER` environment variable so it can find the Manager over the network,
> copy the SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager,
> and copy the scripts under `./kitodo/overwrites/data/scripts/` to the server's `/usr/local/kitodo`.
>
> See [this Wiki article](https://github.com/slub/ocrd_kitodo/wiki/Adapting-an-external-Kitodo.Production-instance)
> for details.

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