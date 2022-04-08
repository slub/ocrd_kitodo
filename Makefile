TAGNAME ?= markusweigelt/ocrd_manager
SHELL = /bin/bash

CONTROLLER_ENV_UID ?= $(shell id -u)
CONTROLLER_ENV_GID ?= $(shell id -g)
MANAGER_ENV_UID ?= $(shell id -u)
MANAGER_ENV_GID ?= $(shell id -g)

.EXPORT_ALL_VARIABLES:

build: ./kitodo
build: ./kitodo/.ssh/id_rsa
build: ./ocrd/manager/.ssh/id_rsa
build: ./ocrd/controller/.ssh/authorized_keys
build: ./ocrd/manager/.ssh/authorized_keys

./kitodo: ./_tmp/config_modules.zip
	unzip $< -d $@

./kitodo/.ssh: ./kitodo

./ocrd/controller/models/ ./ocrd/controller/config/  ./ocrd/manager/.ssh/ ./kitodo/.ssh/ ./ocrd/controller/.ssh/:
	mkdir -p $@

./kitodo/.ssh/id_rsa: | ./kitodo/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'Kitodo.Production key'

./ocrd/manager/.ssh/id_rsa: | ./ocrd/manager/.ssh
	ssh-keygen -t rsa -q -f $@ -P '' -C 'OCR-D manager key'

./ocrd/controller/.ssh/authorized_keys: ./ocrd/manager/.ssh/id_rsa | ./ocrd/controller/.ssh/
	mv $<.pub $@

./ocrd/manager/.ssh/authorized_keys: ./kitodo/.ssh/id_rsa
	mv $<.pub $@

start:
	docker-compose -f docker-compose.yml -f docker-compose-controller.yml up -d

stop:
	docker-compose -f docker-compose.yml -f docker-compose-controller.yml down

define HELP
cat <<"EOF"
Targets:
	- build	create directories and ssh key files
	- start	run docker-compose up
	- down	stop&rm docker-compose up

Variables:
	- CONTROLLER_ENV_UID	user id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_UID))
	- CONTROLLER_ENV_GID	group id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_GID))
	- MANAGER_ENV_UID	user id to use on the OCR-D Manager (default: $(MANAGER_ENV_UID))
	- MANAGER_ENV_GID	group id to use on the OCR-D Manager (default: $(MANAGER_ENV_GID))
EOF
endef
export HELP
help: ; @eval "$$HELP"

.PHONY: build start stop help
