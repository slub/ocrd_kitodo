TAGNAME ?= markusweigelt/ocrd_manager
SHELL = /bin/bash

build: ./kitodo
build: ./kitodo/.ssh/id_rsa
build: ./ocrd/manager/.ssh/id_rsa
build: ./ocrd/controller/.ssh/authorized_keys
build: ./ocrd/controller/.ssh/authorized_keys
build: docker-compose.override.yml

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

docker-compose.override.yml: UID ?= $(shell id -u)
docker-compose.override.yml: GID ?= $(shell id -g)
docker-compose.override.yml:
	@echo "services:" > $@
	@echo "    ocrd-controller:" >> $@
	@echo "        environment:" >> $@
	@echo "          - UID=$(UID)" >> $@
	@echo "          - GID=$(GID)" >> $@
	@echo "    ocrd-manager:" >> $@
	@echo "        environment:" >> $@
	@echo "          - UID=$(UID)" >> $@
	@echo "          - GID=$(GID)" >> $@

start: docker-compose.override.yml
	docker-compose -f docker-compose.yml -f docker-compose-kitodo.yml -f docker-compose.override.yml up -d

stop: docker-compose.override.yml
	docker-compose -f docker-compose.yml -f docker-compose-kitodo.yml -f docker-compose.override.yml down

define HELP
cat <<"EOF"
Targets:
	- build	create directories and ssh key files
	- start	run docker-compose up
	- down	stop&rm docker-compose up
EOF
endef
export HELP
help: ; @eval "$$HELP"

.PHONY: build start stop help
