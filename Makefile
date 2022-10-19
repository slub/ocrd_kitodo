SHELL = /bin/bash

CONTROLLER_ENV_UID ?= $(shell id -u)
CONTROLLER_ENV_GID ?= $(shell id -g)
MANAGER_ENV_UID ?= $(shell id -u)
MANAGER_ENV_GID ?= $(shell id -g)

COMPOSE_PROFILES ?= with-kitodo-production,with-ocrd-controller

.EXPORT_ALL_VARIABLES:

# removes files and directories of prepare target
clean:
	$(RM) -fr kitodo ocrd _resources/data

# private SSH key for login from Production to Manager
prepare-keys: ./kitodo/.ssh/id_rsa
# public SSH keys for logins allowed on Manager
prepare-keys: ./ocrd/manager/.ssh/authorized_keys
# private SSH key for login from Manager to Controller
prepare-keys: ./ocrd/manager/.ssh/id_rsa
# public SSH keys for logins allowed on Controller
prepare-keys: ./ocrd/controller/.ssh/authorized_keys

ifneq ($(findstring with-kitodo-production,$(COMPOSE_PROFILES)),)
# example data for Production (users, projects, processes)
prepare-examples: ./_resources/data
endif
ifneq ($(findstring with-ocrd-controller,$(COMPOSE_PROFILES)),)
# initial OCR model for Controller
prepare-examples: | ./ocrd/controller/models/ocrd-resources/ocrd-tesserocr-recognize/frak2021.traineddata
endif

prepare: prepare-keys prepare-examples

./%/:
	mkdir -p $@

# generate private SSH key for login from Production to Manager
./kitodo/.ssh/id_rsa: | ./kitodo/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'Kitodo.Production key'
ifeq ($(findstring with-kitodo-production,$(COMPOSE_PROFILES)),)
	@echo "You should now install the private key $@ to your own Kitodo.Production instance,"
	@echo "or conversely install the existing public key of your Kitodo.Production instance to ./ocrd/controller/.ssh/authorized_keys"
endif

# generate private SSH key for login from Manager to Controller
./ocrd/manager/.ssh/id_rsa: | ./ocrd/manager/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'OCR-D manager key'
ifeq ($(findstring with-ocrd-controller,$(COMPOSE_PROFILES)),)
	@echo "You should now install the public key $@.pub to your own OCR-D Controller instance,"
	@echo "or conversely install the existing private key for your OCR-D Controller instance to $@"
endif

# derive public SSH keys for logins allowed on Controller from private SSH key for login from Manager
./ocrd/controller/.ssh/authorized_keys: ./ocrd/manager/.ssh/id_rsa | ./ocrd/controller/.ssh/
	cp $<.pub $@

# derive public SSH keys for logins allowed on Controller from private SSH key for login from Manager
./ocrd/manager/.ssh/authorized_keys: ./kitodo/.ssh/id_rsa
	cp $<.pub $@

# unzip prebuilt example data for Production (users, projects, processes)
./_resources/data: ./_resources/data.zip
	unzip $< -d ./_resources
	touch -m $@

# install initial OCR model for Controller
./ocrd/controller/models/ocrd-resources/ocrd-tesserocr-recognize/frak2021.traineddata: | ./ocrd/controller/models/ocrd-resources/ocrd-tesserocr-recognize/
	wget -O $@ https://ub-backup.bib.uni-mannheim.de/~stweil/tesstrain/frak2021/tessdata_best/frak2021-0.905.traineddata

build:
	docker compose build

start:
	docker compose up -d

down:
	docker compose down

stop:
	docker compose stop

config:
	docker compose config

status:
	docker compose ps

define HELP
cat <<"EOF"
Targets:
	- prepare:	create directories, SSH key files and examples
	- build:	`docker compose build` all images
	- start:	`docker compose up` all containers (in detached mode)
	- down:		`docker compose down` all containers (i.e. stop and remove)
	- stop:		`docker compose stop` all containers (i.e. only stop)
	- config:	dump all the composed files
	- status:	list running containers

Variables:
	- CONTROLLER_ENV_UID	user id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_UID))
	- CONTROLLER_ENV_GID	group id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_GID))
	- MANAGER_ENV_UID	user id to use on the OCR-D Manager (default: $(MANAGER_ENV_UID))
	- MANAGER_ENV_GID	group id to use on the OCR-D Manager (default: $(MANAGER_ENV_GID))
	- COMPOSE_PROFILES	contains 'with-ocrd-controller' if OCR-D Controller service should be started/stopped here,
				contains 'with-kitodo-production' if Kitodo.Production service should be started/stopped here,
				comma-separated (default: $(COMPOSE_PROFILES))
	- in addition, all variables defined in .env can be overridden via shell or make
EOF
endef
export HELP
help: ; @eval "$$HELP"

.PHONY: clean prepare prepare-keys prepare-examples build build-kitodo start down config status help

# do not search for implicit rules here:
%.zip: ;
Makefile: ;
