## Testing

To download some testdata and process them on the OCR-D Manager
(which must already be running, and must be able to connect to the Controller), do:

    make test-production   # test for_production.sh (images→ALTO-XML)
    make test-presentation # test for_presentation.sh (METS→METS)
    make test              # run both
    make clean-testdata    # remove the test data and test results

## ocrd-manager

This service provides a pure SSH server under `${MANAGER_PORT_SSH}`, allowing a user `ocrd`
to log in with the [configured](setup/preparation) credentials. 

The system contains an installation of [OCR-D/core](https://github.com/OCR-D/core), i.e.
including the `ocrd` multi-purpose CLI. It also features two shell scripts meant
as entry points for the most common integration scenarios:

- `for_production.sh`: process image files, yield ALTO files
- `for_presentation.sh`: process METS, yield updated METS and ALTO files

For details of the user interface, see [Manager Readme](https://github.com/slub/ocrd_manager#processing).

## ocrd-monitor

Provides a web interface under `http://localhost:${MONITOR_PORT_WEB}` for 

- browsing workspaces with OCR-D Browser to inspect intermediate/final processing results 
- getting statistics of running and terminated jobs 
- reading and searching Docker logs

## ocrd-logview

Provides a web interface under `http://localhost:${MONITOR_PORT_LOG}`
using [Dozzle](https://github.com/amir20/dozzle) for browsing live
Docker logs of all running containers.

