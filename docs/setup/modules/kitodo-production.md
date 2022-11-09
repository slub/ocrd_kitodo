Enables the `kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq` services.

> Without this, you may want to build, configure, start and stop [Kitodo.Production](https://github.com/slub/kitodo-production-docker)
> _externally and possibly remotely_.

> If you _do_ want to connect an external Kitodo with the Manager, you _must_ also
> set up its `OCRD_MANAGER` environment variable so it can find the Manager over the network,
> and a SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager.

## Usage

Open your browser and navigate to http://localhost:8080/kitodo after OCR-D and Kitodo are started.

Enter the user name `testadmin` and the password `test` in the login dialog.

> Note: If it is the first launch of Kitodo.Production,
> then the `Indexing` tab of the system page is displayed,
> because indexing still needs to be done.
> To perform the indexing, click on the button `Create ElasticSearch mapping`.
> After the mapping is created, click on the button `Start indexing` next to
> the `Whole index` label. After a few seconds, the index is created and you
> can navigate to the dashboard by clicking on the Kitodo.Production logo.

### Kitodo extensions

After the [steps for installation of extra resources into Kitodo](#prepare-keys-and-examples), specifically the subtarget `make prepare-data`, and starting up Kitodo.Production, a number of extensions will become available:

- a new script task for OCR processing from the process directory
- a new script task for OCR processing from the export directory
- a new example workflow which includes both of them

You can find the latter under `Projects` -> `Workflows` -> `OCR_Workflow`.

![image](https://user-images.githubusercontent.com/3832618/196455027-db85f67c-b4b3-4db8-a43a-eac998281a1f.png)

In this Kitodo workflow, the script tasks `OCR from Process Dir` (before manual Structure Editor)
and `OCR from Export Dir` (after DMS Export) have been added to trigger automatic OCR processing with OCR-D.

Moreover, if during installation the subtarget `make prepare-examples` has been run, then
an example user, project and process are present in the database. (That process uses the new workflow,
but is stopped just prior to the first OCR.)

#### Execute script task "OCR from Process Dir"

This script task executes the script `script_ocr_process_dir.sh` from the `scripts` directory and passes the selected `process id` and the current `task id` as parameters.

To execute this script task manually, navigate from the dashboard to `All processes` by clicking
on the button in the Processes widget, or use the URL http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0.

Select a process to execute the script task, and click on `Possible actions` and then on `Execute KitodoScript`.

Type the following text into the form field:

```
action:runscript "stepname:OCR from Process Dir" "script:OCR Process Dir"
```

... and click on `Execute KitodoScript`.
(This will run the simplistic Tesseract-based default workflow
asynchronously. The process status will change as soon as the job
is finished.)

Watch `docker logs`, or look under the hood with the Monitor.

#### Execute script task "OCR from Export Dir"

This script task executes the script `script_ocr_export_dir.sh` from the `scripts` directory and passes the selected `process title` and the current `task id` as parameters.
The automatic script task is bound to the manual task `Export DMS` in the workflow, because it needs the METS from the export directory that is created via the DMS export.

To export the METS of a process manually, navigate from the dashboard to `All processes` by clicking on the button in the Processes widget, or use the URL http://localhost:8080/kitodo/pages/processes.jsf?tabIndex=0.


Select a process to export, click on `Possible actions` and then on `Export DMS`. After a successful export,
the METS is located in the export directory `/usr/local/kitodo/dms-export/` in a subdirectory named by
the selected process.

> **Note**: The export directory can be changed under the project settings and can only be found in our sample project under this path `/usr/local/kitodo/dms-export/`.

After that the status of the task can be set to `Completed` and our script task `OCR from Export Dir` will be executed automatically.

Equivalently, to execute the script task manually after the METS has been exported (in some other workflow),
enter an `Execute KitodoScript` action in the same way as above, but with the text:

```
action:runscript "stepname:OCR from Export Dir" "script:OCR Export Dir"
```

> :construction: The `script_ocr_export_dir.sh` is still work in process, and does not perform any actual processing of the METS at the moment.
> (It only prints a message which parameters it was called with.)

### More configuration options
- [Using project-specific OCR Workflows in Kitodo.Production](https://github.com/slub/ocrd_kitodo/wiki/Using-project-specific-OCR-Workflows-in-Kitodo.Production)


## Environment Variables

### Application

{% include '_generated/env-app-table.md' %}

### Database

{% include '_generated/env-db-table.md' %}

### Elastic Search

{% include '_generated/env-es-table.md' %}

### Active MQ

{% include '_generated/env-mq-table.md' %}