TAGNAME ?= markusweigelt/ocrd_manager
SHELL = /bin/bash

CONTROLLER_ENV_UID ?= $(shell id -u)
CONTROLLER_ENV_GID ?= $(shell id -g)
MANAGER_ENV_UID ?= $(shell id -u)
MANAGER_ENV_GID ?= $(shell id -g)

MODE ?= managed
ifeq (managed,$(MODE))
COMPOSE_FILE = docker-compose.yml:docker-compose.kitodo-app.yml:docker-compose.managed.yml
else
COMPOSE_FILE = docker-compose.yml:docker-compose.kitodo-app.yml
endif
COMPOSE_PATH_SEPARATOR = :

.EXPORT_ALL_VARIABLES:

clean:
	$(RM) -fr kitodo ocrd _resources/data _modules/kitodo-production-docker/kitodo/build-resources

prepare-keys: ./kitodo/.ssh/id_rsa
prepare-keys: ./ocrd/manager/.ssh/id_rsa
prepare-keys: ./ocrd/controller/.ssh/authorized_keys
prepare-keys: ./ocrd/manager/.ssh/authorized_keys
prepare-examples: ./_resources/data | ./ocrd/controller/models/ocrd-resources/ocrd-tesserocr-recognize/frak2021.traineddata
prepare: prepare-keys prepare-examples 

./%/:
	mkdir -p $@

./kitodo/.ssh/id_rsa: | ./kitodo/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'Kitodo.Production key'

./ocrd/manager/.ssh/id_rsa: | ./ocrd/manager/.ssh/
	ssh-keygen -t rsa -q -f $@ -P '' -C 'OCR-D manager key'

./ocrd/controller/.ssh/authorized_keys: ./ocrd/manager/.ssh/id_rsa | ./ocrd/controller/.ssh/
	cp $<.pub $@

./ocrd/controller/models/ocrd-resources/ocrd-tesserocr-recognize/frak2021.traineddata: | ./ocrd/controller/models/ocrd-resources/ocrd-tesserocr-recognize/
	wget -O $@ https://ub-backup.bib.uni-mannheim.de/~stweil/tesstrain/frak2021/tessdata_best/frak2021-0.905.traineddata

./ocrd/manager/.ssh/authorized_keys: ./kitodo/.ssh/id_rsa
	cp $<.pub $@

./_resources/data: ./_resources/data.zip
	unzip $< -d ./_resources
	touch -m $@

build-kitodo: ./_modules/kitodo-production-docker/kitodo/build-resources

./_modules/kitodo-production-docker/kitodo/build-resources:
	docker-compose -f docker-compose.kitodo-builder.yml up --abort-on-container-exit --build
	docker-compose -f docker-compose.kitodo-builder.yml down
	touch -m $@

build: build-kitodo
	docker-compose build

start:
	docker-compose up -d

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
	- prepare create directories, ssh key files and examples
	- build	build kitodo resources and all images
	- start	run docker-compose up in detached mode
	- down	stop and remove docker-compose up
	- stop	stops docker-compose up
	- config	dump all the composed files
	- status	list running containers

Variables:
	- CONTROLLER_ENV_UID	user id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_UID))
	- CONTROLLER_ENV_GID	group id to use on the OCR-D Controller (default: $(CONTROLLER_ENV_GID))
	- MANAGER_ENV_UID	user id to use on the OCR-D Manager (default: $(MANAGER_ENV_UID))
	- MANAGER_ENV_GID	group id to use on the OCR-D Manager (default: $(MANAGER_ENV_GID))
	- MODE	if 'managed', also starts/stops OCR-D Controller here (default: $(MODE))
	- in addition, all variables defined in .env can be overridden via shell or make
EOF
endef
export HELP
help: ; @eval "$$HELP"

.PHONY: clean prepare prepare-keys prepare-examples build build-kitodo start down config status help

# do not search for implicit rules here:
%.zip: ;
Makefile: ;
