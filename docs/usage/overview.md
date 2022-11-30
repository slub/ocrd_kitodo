# Overview

The [various module services](setup/configure-modules.md) each serve different kinds of "users":
- [ocrd-logview](usage/ocrd-manager.md#ocrd-logview) is an administrator tool showing live Docker logs for all containers.
- [ocrd-controller](usage/ocrd-controller.md) is (currently) a dedicated SSH server 
  allowing a user `ocrd` to log in and run shell scripts which involve OCR-D workflows composed of various OCR-D processor calls.  
  (An [external instance](setup/configure-external.md) will behave the same, without being controlled as a service here.)
- [ocrd-manager](usage/ocrd-manager.md) is (currently) a generic SSH server 
  allowing a user `ocrd` to log in and run shell scripts which involve OCR-D tasks (that will usually delegate to `ocrd-controller`), notably 
  - [`for_production.sh`](https://github.com/slub/ocrd_manager#from-image-to-alto-files)
  - [`for_presentation.sh`](https://github.com/slub/ocrd_manager#from-mets-to-mets-file)
- [kitodo-app](usage/kitodo-production.md) is an instance of 
  [Kitodo.Production](https://github.com/slub/kitodo-production-docker) with some OCR-D specific,
  [optional extensions](https://github.com/markusweigelt/kitodo-production/tree/ocrd-main),
  and some [example data](https://slub.github.io/ocrd_kitodo/setup/preparation/#prepare-keys-and-kitodo-extensions)
  which aids in our [kick-start demonstration](usage/demo.md)  
  (An [external instance](setup/configure-external.md) will behave the same, without being controlled as a service here – 
   but with your _actual_ data, and probably without the extensions.)
- [ocrd-monitor](usage/ocrd-manager.md#ocr-d-monitor) provides a webserver for monitoring jobs and logs, 
  to inspect results and workflows, and customise+rerun workflows.

Thus, only the latter two could be considered "end users".

# Data

Depending on how exactly you [set up](setup/configure-modules.md) your module services, 
they will be configured to use a number of specific **filesystem paths** from your host system
as persistent volumes inside the service containers. What follows is a description of the
configuration variables, along with their respective default values and an explanation of their
role and lifetime.

(Again, if you have [disabled](setup/enable-disable-modules.md) said modules,
then the same applies, but to their respective remote hosts.)

- `CONTROLLER_DATA=./ocrd/controller/data`:
  - `$CONTROLLER_DATA/KitodoJob*`: temporary storage for OCR-D workspaces during OCR processing  
    (all images and METS will be copied here; gets filled with OCR results; to be removed after the job is done)
- `MANAGER_DATA=./kitodo/data/metadata`:
  - `$MANAGER_DATA/ocr-d/*`: transient storage for OCR-D workspaces between first OCR request and final success  
    (all images will be copied – cloned/CoW/reflink if possible – here; METS is created here; OCR results will be copied here; 
     can be re-used if the OCR job failed, e.g. by re-entering with a different workflow; to be removed sometime after
     the OCR job was successful and no user interaction followed)
  - `$MANAGER_DATA/*`: directories for input (images or METS) and output (ALTO) files  
    (shared with Kitodo.Production or Kitodo.Presentation; to be removed by caller)
- `MONITOR_DATA=./kitodo/data/metadata`: same as `MANAGER_DATA`, shared for data browsing
- `APP_DATA=./kitodo/data`:
  - `$APP_DATA/metadata/*`: same as `MANAGER_DATA`, shared for i/o

![architecture](https://user-images.githubusercontent.com/38561704/204787229-ad83732b-39b1-4028-9439-7a22c92f0065.png)
