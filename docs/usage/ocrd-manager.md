## Testing

To download some testdata and process them on the OCR-D Manager
(which must already be running, and must be able to connect to the Controller), do:

    make test-production   # test for_production.sh (images→ALTO-XML)
    make test-presentation # test for_presentation.sh (METS→METS)
    make test              # run both
    make clean-testdata    # remove the test data and test results


## OCR-D Monitor

Provides a web interface under `http://${MONITOR_HOST}:${MONITOR_PORT_WEB}` (by default under `http://localhost:5000`) for 

- browsing workspaces with OCR-D Browser to inspect intermediate/final processing results 
- getting statistics of running and terminated jobs 
- reading and searching Docker logs
