Enables the `kitodo-app`, `kitodo-db`, `kitodo-es` and `kitodo-mq` services.

> Without this, you may want to build, configure, start and stop [Kitodo.Production](https://github.com/slub/kitodo-production-docker)
> _externally and possibly remotely_.

> If you _do_ want to connect an external Kitodo with the Manager, you _must_ also
> set up its `OCRD_MANAGER` environment variable so it can find the Manager over the network,
> and a SSH private key in its `/.ssh/id_rsa` matching a public key accepted by the Manager.

## Configuration

### Environment Variables

{% include 'docs/_include/modules-configuration-general.md' %}

#### Application

{% include '_generated/env-app-table.md' %}

#### Database

{% include '_generated/env-db-table.md' %}

#### Elastic Search

{% include '_generated/env-es-table.md' %}

#### Active MQ

{% include '_generated/env-mq-table.md' %}

## Usage

### Project-specific OCR Workflows (experimental)

> **Note**:
> The feature is not currently available in the main Kitodo.Production repository or a release. To use the feature, you must use the non-official Kitodo.Production state from the [following branch](https://github.com/markusweigelt/kitodo-production/tree/ocrd-main).

Execute project-specific OCR workflows by binding an OCR workflow to a process template.
When a new process is created, the OCR workflow file assigned to the process template is copied as `ocr_workflow.sh` to the process folder.
Our `script_ocr.sh` script detects and uses the `ocr_workflow.sh` file as OCR workflow when executing the OCR script steps.

To provide this behavior in Kitodo.Production, perform the following steps:

1. Configure OCR workflows folder
    - Create folder `ocr_workflows` under `/usr/local/kitodo` to use default configuration or replace default path of `directory.ocr.workflow` property value in `kitodo_config.properties`
    - Add your OCR workflows with `*.sh` file extension to this folder
2. Add OCR workflow client authorities to your client
    - Navigate to user roles and edit role you want to add the authorities
    - Under client authorities search for "OCR workflow" and assign authorities to role
3. Assign OCR workflow to process template
    - Navigates to project and click on "New" -> "New OCR workflow"
    - Enter the title of the OCR workflow and select one OCR workflow file which you have stored in the OCR workflows folder
    - After saving the OCR workflow you will be redirected to list of all OCR Workflows in Kitodo.Production in tab "OCR Workflows" under projects
    - Navigate to "Process templates" under projects and click on edit on the template which you want to link to the previously created "OCR Workflow"
    - Under the label "OCR Workflow" select your created "OCR Workflow" by title and save the template