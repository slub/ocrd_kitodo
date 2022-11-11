To download some testdata and process them on the Manager
(which must already be running, and must be able to connect to the Controller), do:

    make test-production   # test for_production.sh (images→ALTO-XML)
    make test-presentation # test for_presentation.sh (METS→METS)
    make test              # run both
    make clean-testdata    # remove the test data and test results