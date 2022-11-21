The documentation is structured in two main parts "Setup" and "Usage". The "Setup" part describes all the information needed to set up our project before the necessary services of the modules can be started. The "Usage" part, on the other hand, contains information about configurations and usage at runtime.

Take a look at our quickstart when you just want to start the project.

## Quickstart 

## Overview of modules

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

The structure of our project consists of three modules whereby the OCR-D Controller and Kitodo.Production module are optional.
For these modules an existing [OCR-D Controller](https://github.com/slub/ocrd_controller) and/or [Kitodo.Production](https://github.com/kitodo/kitodo-production) installation can be used.

The OCR-D Manager module contains the homonymous OCR-D Manager and the OCR-D Monitor. The OCR-D Manager mediates between Kitodo.Production and OCR-Controller on system level.
This process is saved as job. The OCR-D Monitor provides a web interface to view running or already completed jobs and their workflow and in the future also to manage workflows and trigger or rerun jobs.

In addition to Kitodo.Production, Kitodo.Presentation or other applications can also be linked to the OCR-D Manager.
