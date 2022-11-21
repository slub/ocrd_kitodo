# Getting Started

This page is an overview of the OCR-D with Kitodo documentation and related resources.

# Architecture

``` mermaid
graph LR
MA(OCR-D Manager) ----> CO(OCR-D Controller)
MO(OCR-D Monitor) ----> MA
KP(Kitodo.Production) ----> MA
KP ----> DB(Database)
KP ----> EL(Elastic Search)
KP ----> MQ(Active MQ)
MA ----> MQ
subgraph OCR-D Manager Module
MO
MA
end
subgraph COM[OCR-D Controller Module]
CO
end
subgraph KPM[Kitodo.Production Module]
DB
EL
MQ
KP
end

style KPM stroke-dasharray: 5 5
style COM stroke-dasharray: 5 5
```

The structure of our project consists of three modules whereby the OCR-D Controller and Kitodo.Production module are optional.
For these modules an existing [OCR-D Controller](https://github.com/slub/ocrd_controller) and/or [Kitodo.Production](https://github.com/kitodo/kitodo-production) installation can be used.

The OCR-D Manager module contains the homonymous OCR-D Manager and the OCR-D Monitor. The OCR-D Manager mediates between Kitodo.Production and OCR-Controller on system level.
This process is saved as job. The OCR-D Monitor provides a web interface to view running or already completed jobs and their workflow and in the future also to manage workflows and trigger jobs.

In addition to Kitodo.Production, Kitodo.Presentation or other applications can also be linked to the OCR-D Manager. For Kitodo.Presentation the OCR-D manager already brings a possible script for use or customization with it.

## Planned architecture of integration project

Our implementation project "[Integration of Kitodo and OCR-D for productive mass digitisation](https://ocr-d.de/en/phase3#integration-of-kitodo-and-ocr-d-for-productive-mass-digitisation)" is intended to enable the use of OCR-D in mass digitization with Kitodo.

![architecture](https://user-images.githubusercontent.com/3832618/201408254-0dab72b5-b77e-4da4-a084-7f1e0be10f75.png)



