The documentation is structured in two main parts: 

- The [Setup](setup/prerequisites.md) part describes all the information 
  to **install, configure and run** the various services of the modules as needed. 
- The [Usage](usage/ocrd-manager.md) part contains information about 
  configuration and usage of those services **at runtime**.

For the impatient, the following provides a quickstart look of what you would typically need to do when getting started the first time.

## Quickstart 

Make sure that the system [prerequisites](setup/prerequisites.md) are met, including having `make` installed.

Then go to the directory where you have checked out the project, and do:

    make prepare

    make start

Now the services for all modules have been started and filled with dummy data for a [demonstration example](usage/demo.md).
(So the latter page explains how you can start OCR processing from the Kitodo application.)

## Overview of modules

Our project consists of three **modules**:

- the [OCR-D Manager](https://github.com/slub/ocrd_manager),
- the [OCR-D Controller](https://github.com/slub/ocrd_controller) and
- [Kitodo.Production](https://github.com/kitodo/kitodo-production).

The latter two modules are optional: For either of these, an existing installation can be used
(see [Configure External](setup/configure-external.md) for more details).

Each module in turn comprises a number of **services**:

``` mermaid
graph LR
subgraph KPM[Kitodo.Production Module]
DB
EL
MQ
KP
end
subgraph MAM[OCR-D Manager Module]
MO
MA
end
subgraph COM[OCR-D Controller Module]
CO
end

MA(OCR-D Manager) <--> CO(OCR-D Controller)
MO(OCR-D Monitor) --> MA
KP(Kitodo.Production) --> MA
KP -.->  DB(Database)
KP -.->  EL(Elastic Search)
KP -.->  MQ(Active MQ)
MA -.-> MQ

style KPM stroke-dasharray: 5 5
style COM stroke-dasharray: 5 5
```

The OCR-D Manager module contains the homonym OCR-D Manager service and the OCR-D Monitor service. 

The OCR-D Manager service mediates between Kitodo.Production and OCR-D Controller on the system level
for each OCR processing task. This task is saved as job information file. The OCR-D Monitor service provides
a web interface to view running or already completed jobs, and their respective OCR results and workflow configuration.
In the future, it will also support managing workflows and triggering or rerunning jobs.

Besides Kitodo.Production, you can also link Kitodo.Presentation or other applications to the OCR-D Manager.
