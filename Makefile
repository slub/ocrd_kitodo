TAGNAME ?= markusweigelt/ocrd_manager
SHELL = /bin/bash

build:
	mkdir -p ./ocrd/controller/models/ ./ocrd/controller/config/ ./ocrd/controller/.ssh/ ./ocrd/manager/.ssh/ ./kitodo/.ssh/

	ssh-keygen -t rsa -q -f ./ocrd/manager/.ssh/id_rsa -P '' -C 'OCR-D manager key'
	
	ssh-keygen -t rsa -q -f ./kitodo/.ssh/id_rsa -P '' -C 'Kitodo.Production key'
	
	mv ./ocrd/manager/.ssh/id_rsa.pub ./ocrd/controller/.ssh/authorized_keys
	
	mv ./kitodo/.ssh/id_rsa.pub ./ocrd/manager/.ssh/authorized_keys
	
define HELP
cat <<"EOF"
Targets:
	- build	create directories and ssh key files
EOF
endef
export HELP
help: ; @eval "$$HELP"

.PHONY: build help