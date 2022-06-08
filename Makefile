TAGNAME ?= markusweigelt/ocrd_manager
SHELL = /bin/bash

CONTROLLER_ENV_UID ?= $(shell id -u)
CONTROLLER_ENV_GID ?= $(shell id -g)
MANAGER_ENV_UID ?= $(shell id -u)
MANAGER_ENV_GID ?= $(shell id -g)

MODE ?= managed
COMPOSE_FILES = docker-compose.yml
ifeq (managed,$(MODE))
COMPOSE_FILES += docker-compose.managed.yml
endif
COMPOSE_FILES += docker-compose.kitodo-app.yml
COMPOSE_FILES += docker-compose.kitodo-app.override.yml
NULL :=
WHITE := $(NULL) $(NULL)
COLON := :
COMPOSE_FILE = $(subst $(WHITE),$(COLON),$(COMPOSE_FILES))

.EXPORT_ALL_VARIABLES:

clean:
	$(RM) -fr kitodo ocrd

build: ./kitodo
build: ./kitodo
build: ./kitodo/.ssh/id_rsa
build: ./ocrd/manager/.ssh/id_rsa
build: ./ocrd/controller/.ssh/authorized_keys
build: ./ocrd/manager/.ssh/authorized_keys
build:
	$(MAKE) -C _modules/kitodo-production-docker build

./kitodo: ./_resources/config_modules.zip

./kitodo: ./_resources/config_modules.zip
	unzip $< -d $@
	touch -m $@

./kitodo/.ssh/: ./kitodo

./ocrd/controller/models/ ./ocrd/controller/config/  ./ocrd/manager/.ssh/ ./kitodo/.ssh/ ./ocrd/controller/.ssh/:
	mkdir -p $@

./kitodo/.ssh/id_rsa: | ./kitodo/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'Kitodo.Production key'

./ocrd/manager/.ssh/id_rsa: | ./ocrd/manager/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'OCR-D manager key'

./ocrd/controller/.ssh/authorized_keys: ./ocrd/manager/.ssh/id_rsa | ./ocrd/controller/.ssh/
	cp $<.pub $@

./ocrd/manager/.ssh/authorized_keys: ./kitodo/.ssh/id_rsa
	cp $<.pub $@

start:
	docker-compose up --build -d

down:
	docker-compose down

stop:
	docker-compose stop

config:
	docker-compose config

status:
	docker-compose ps

define HELP
cat <<"EOF"
Targets:
	- build	create directories and ssh key files
	- start	run docker-compose up
	- down	stop & rm docker-compose up
	- stop	stops docker-compose up
	- config	dump all the composed files
	- status	list running containers

Variables:
	- CONTROLLER_ENV_UID	user id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_UID))
	- CONTROLLER_ENV_GID	group id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_GID))
	- MANAGER_ENV_UID	user id to use on the OCR-D Manager (default: $(MANAGER_ENV_UID))
	- MANAGER_ENV_GID	group id to use on the OCR-D Manager (default: $(MANAGER_ENV_GID))
	- MODE			if 'managed', also starts/stops OCR-D Controller here (default: $(MODE))
EOF
endef
export HELP
help: ; @eval "$$HELP"

.PHONY: clean build start down config status help

# do not search for implicit rules here:
%.zip Makefile: ;
