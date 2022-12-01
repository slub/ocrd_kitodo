The following variables must be defined when starting the module service(s), respectively.

> **Note**:
> By _default_ this is done in `.env` file (with shell-like syntax).
> But any environment variable settings via shell or `make` call take
> _precedence_ of `.env` configuration.
> So for example, you can `source .env` and then customize the
> default values interactively.
> Alternatively, you can import a customized file, e.g. `source .env.local`.)
>
> **Note**:
> When using the Makefile, some of the static settings in `.env` will always
> be overridden dynamically: To optimally match ownership and permissions of
> existing files with new data to be written, the UID and GID of the `ocrd` user
> on the Controller and Manager are taken from the host system.
>
> **Note**:
> If you do not want to [`make build`](running.md#building) the images yourself, but
> use the _prebuilt_ images from GitHub Container Registry, then mind the image _tag_ variables.
> Instead of the default `latest` development version, you may want to use
> a stable release: Just checkout the respective Git release, and `.env`
> should already point to stable tags.

## OCR-D Manager

{% include '_generated/env-manager-table.md' %}

It is allowed and realistic if `MANAGER_DATA` is different from `CONTROLLER_DATA`.
Input/output will be synchronized between them at runtime.

Currently, `MANAGER_DATA` should be the same path as `APP_DATA/metadata`
(which could be just a NFS mountpoint on either side).

### OCR-D Monitor

The OCR-D Manager module also includes an OCR-D Monitor service, which can also be configured here.

{% include '_generated/env-monitor-table.md' %}

Currently, `MONITOR_DATA` should be the same path as `MANAGER_DATA`.

## OCR-D Controller

(only relevant in profile **with-ocrd-controller**, see [Enable/Disable Modules](setup/enable-disable-modules.md))

{% include '_generated/env-controller-table.md' %}

## Kitodo.Production

(only relevant in profile **with-kitodo-production**, see [Enable/Disable Modules](setup/enable-disable-modules.md))

### Application

{% include '_generated/env-app-table.md' %}

### Database

{% include '_generated/env-db-table.md' %}

### Elastic Search

{% include '_generated/env-es-table.md' %}

### Active MQ

{% include '_generated/env-mq-table.md' %}