SHELL = /bin/bash

CONTROLLER_ENV_UID ?= $(shell id -u)
CONTROLLER_ENV_GID ?= $(shell id -g)
MANAGER_ENV_UID ?= $(shell id -u)
MANAGER_ENV_GID ?= $(shell id -g)

COMPOSE_PROFILES ?= with-kitodo-production,with-ocrd-controller

.EXPORT_ALL_VARIABLES:

# conditional assignment operator ?= creates deferred variables only, so use conditionals directly:
ifndef APP_DATA
APP_DATA != source .env && echo $$APP_DATA # ${PWD}/kitodo/data 
endif
ifndef APP_KEY
APP_KEY != source .env && echo $$APP_KEY # ./kitodo/.ssh/id_rsa
endif
ifndef APP_PORT
APP_PORT != source .env && echo $$APP_PORT # 8080
endif
ifndef MANAGER_KEYS
MANAGER_KEYS != source .env && echo $$MANAGER_KEYS # ./ocrd/manager/.ssh/authorized_keys
endif
ifndef MANAGER_KEY
MANAGER_KEY != source .env && echo $$MANAGER_KEY # ./ocrd/manager/.ssh/id_rsa
endif
ifndef MANAGER_DATA
MANAGER_DATA != source .env && echo $$MANAGER_DATA # ./kitodo/data/metadata/
endif
ifndef MANAGER_WORKFLOWS
MANAGER_WORKFLOWS != source .env && echo $$MANAGER_WORKFLOWS # ./_modules/ocrd_manager/workflows
endif
ifndef CONTROLLER_KEYS
CONTROLLER_KEYS != source .env && echo $$CONTROLLER_KEYS # ./ocrd/controller/.ssh/authorized_keys
endif
ifndef CONTROLLER_DATA
CONTROLLER_DATA != source .env && echo $$CONTROLLER_DATA # ./ocrd/controller/data
endif
ifndef CONTROLLER_MODELS
CONTROLLER_MODELS != source .env && echo $$CONTROLLER_MODELS # ./ocrd/controller/models
endif
ifndef CONTROLLER_CONFIG
CONTROLLER_CONFIG != source .env && echo $$CONTROLLER_CONFIG # ./ocrd/controller/config
endif

# removes (default) files and directories of prepare target
clean: clean-testdata
	$(RM) -fr kitodo ocrd

# private SSH key for login from Production to Manager
prepare-keys: $(APP_KEY)
# public SSH keys for logins allowed on Manager
prepare-keys: $(MANAGER_KEYS)
# private SSH key for login from Manager to Controller
prepare-keys: $(MANAGER_KEY)
# public SSH keys for logins allowed on Controller
prepare-keys: $(CONTROLLER_KEYS)
# mount-point for default data volume of kitodo-app
prepare-keys: | $(MANAGER_DATA)/
# mount-point for default data volume of ocrd-controller
prepare-keys: | $(CONTROLLER_DATA)/
# mount-point for default model volume of ocrd-controller
prepare-keys: | $(CONTROLLER_MODELS)/
# mount-point for default config volume of ocrd-controller
prepare-keys: | $(CONTROLLER_CONFIG)/

# general data for Kitodo.Production
prepare-data: ./kitodo/before_startup.sh ./kitodo/overwrites/data

ifneq ($(findstring with-kitodo-production,$(COMPOSE_PROFILES)),)
# example data for Kitodo.Production (users, projects, processes, workflows, ...)
prepare-examples: ./kitodo/overwrites/sql
endif

ifneq ($(findstring with-ocrd-controller,$(COMPOSE_PROFILES)),)
# initial OCR model for Controller
prepare-examples: | $(CONTROLLER_MODELS)/ocrd-resources/ocrd-tesserocr-recognize/frak2021.traineddata
endif

prepare: prepare-keys prepare-data prepare-examples

./%/:
	mkdir -p $@

# generate private SSH key for login from Production to Manager
$(APP_KEY):
	mkdir -p $(@D)
	ssh-keygen -t rsa -q -f $@ -P '' -C 'Kitodo.Production key'
ifeq ($(findstring with-kitodo-production,$(COMPOSE_PROFILES)),)
	@echo >&2 "	You should now install the private key $@"
	@echo >&2 "	to your own Kitodo.Production instance,"
	@echo >&2 "	or conversely, install the existing public key ~/.ssh/id_rsa.pub"
	@echo >&2 "	of your own Kitodo.Production instance"
	@echo >&2 "	to $(MANAGER_KEYS)."
endif

# generate private SSH key for login from Manager to Controller
$(MANAGER_KEY):
	mkdir -p $(@D)
	ssh-keygen -t rsa -q -f $@ -P '' -C 'OCR-D manager key'
ifeq ($(findstring with-ocrd-controller,$(COMPOSE_PROFILES)),)
	@echo >&2 "	You should now install the public key $@.pub"
	@echo >&2 "	to your own OCR-D Controller instance,"
	@echo >&2 "	or conversely, install the existing private key ~/.ssh/id_rsa"
	@echo >&2 "	for your OCR-D Controller instance to $@"
endif

# derive public SSH keys for logins allowed on Controller from private SSH key for login from Manager
$(CONTROLLER_KEYS): $(MANAGER_KEY)
	mkdir -p $(@D)
	cp $<.pub $@

# derive public SSH keys for logins allowed on Controller from private SSH key for login from Manager
$(MANAGER_KEYS): $(APP_KEY)
	mkdir -p $(@D)
	cp $<.pub $@

# copy before startup script (SSH configuration)
./kitodo/before_startup.sh:
	cp ./_resources/kitodo/before_startup.sh $@

# copy prebuilt data for Production (scripts, OCR-D workflows)
./kitodo/overwrites/data: | ./kitodo/overwrites/
	cp -r ./_resources/kitodo/data $@
	mkdir -p $@/ocr_workflows/
	cp $(MANAGER_WORKFLOWS)/* $@/ocr_workflows/
ifeq ($(findstring with-kitodo-production,$(COMPOSE_PROFILES)),)
	@echo >&2 "	You should now copy $@/scripts"
	@echo >&2 "	to your own Kitodo.Production instance"
	@echo >&2 "	(typically under /usr/local/kitodo)."
endif

# copy examples for Production (users, projects, processes)
./kitodo/overwrites/sql:
	cp -r ./_resources/kitodo-sample/* ./kitodo/overwrites/

# install initial OCR model for Controller
$(CONTROLLER_MODELS)/ocrd-resources/ocrd-tesserocr-recognize/frak2021.traineddata:
	mkdir -p $(@D)
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

pull:
	docker compose pull

status:
	docker compose ps


$(APP_DATA)/metadata/testdata-kitodo:
	mkdir -p $@/images
	for page in {00000009..00000014}; do \
	  wget -P $@/images https://digital.slub-dresden.de/data/kitodo/LankDres_1760234508/LankDres_1760234508_tif/jpegs/$$page.tif.original.jpg; \
	done

ifneq ($(findstring with-kitodo-production,$(COMPOSE_PROFILES)),)
test: test-kitodo
endif

test-kitodo: APP_CONTAINER != docker container ls -qf name=kitodo-app
test-kitodo: $(APP_DATA)/metadata/testdata-kitodo
	$(if $(APP_CONTAINER),$(info using $(APP_CONTAINER)),$(error must run kitodo-app before test-kitodo))
# remove ocr directory if exist
	rm -rf $(APP_DATA)/metadata/testdata-kitodo/ocr
# wait until Kitodo.Production directory structure is initialized
	docker exec -t $(APP_CONTAINER) bash -c "/wait-for-it.sh -t 0 kitodo-app:$$APP_PORT"
# run asynchronous ocr processing, which should return within 5 seconds with exit status 1
	timeout --preserve-status 5 docker exec -t $(APP_CONTAINER) bash -c '/usr/local/kitodo/scripts/script_ocr_process_dir.sh --proc-id "testdata-kitodo" --task-id 1'; test $$? = 1
# check with interval of 1 second if ocr folder exists. It fails if the ocr folder is not created within 5 minutes.
	timeout 5m bash -c 'until test -s $(APP_DATA)/metadata/testdata-kitodo/ocr/alto/00000014.tif.original.xml; do sleep 5; done'
# rest if the alto directory and file exist
	test -d $(APP_DATA)/metadata/testdata-kitodo/ocr/alto
	test -s $(APP_DATA)/metadata/testdata-kitodo/ocr/alto/00000009.tif.original.xml

test test-production test-presentation clean-testdata: NETWORK=ocrd_kitodo_default
# if there is no shell override for MANAGER_DATA, then get it from the .env
# (we must download testdata here, the path must match the currently mounted volume)
test test-production test-presentation clean-testdata: DATA=$(or $(MANAGER_DATA),$(shell eval echo `sed -n s/^MANAGER_DATA=//p .env`))
test test-production test-presentation clean-testdata:
	$(MAKE) -C _modules/ocrd_manager $@

define HELP
cat <<"EOF"
Targets:
	- prepare:	create directories, SSH key files and examples
	- build:	`docker compose build` all images
	- start:	`docker compose up` all containers (in detached mode)
	- down:		`docker compose down` all containers (i.e. stop and remove)
	- stop:		`docker compose stop` all containers (i.e. only stop)
	- config:	dump all the composed files
	- pull:		`docker compose pull` latest prebuilt Docker images for all services
	- status:	`docker compose ps` all running containers
	- test:		run an example workflow on example data on running containers
	- clean-testdata: remove files created by `test`
	- clean: 	remove files created by `prepare` and `test`

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

.PHONY: clean clean-testdata prepare prepare-keys prepare-examples build build-kitodo start down config pull status test test-kitodo help

# do not search for implicit rules here:
%.zip: ;
Makefile: ;
