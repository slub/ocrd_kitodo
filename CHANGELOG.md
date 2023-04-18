# Changelog

## [v20230418-stable](https://github.com/slub/ocrd_kitodo/releases/tag/v20230418-stable)

### Integration of OCR-D and Kitodo


**Full Changelog**: [79bda3b2f33181d7f4fcd13f02b482f912078eef...a4a4eca8ae6dc7a835d6aac2e868b09513f0ab1f](https://github.com/slub/ocrd_kitodo/compare/79bda3b2f33181d7f4fcd13f02b482f912078eef...a4a4eca8ae6dc7a835d6aac2e868b09513f0ab1f)

### OCR-D Controller

* Provide default value for CONTROLLER_KEYS variable by @SvenMarcus in https://github.com/slub/ocrd_controller/pull/28
* Defaults for volume source  by @markusweigelt in https://github.com/slub/ocrd_controller/pull/27
* Update publish.yml to build stable version by @markusweigelt in https://github.com/slub/ocrd_controller/pull/25
* Separation of the host port assignment by @markusweigelt in https://github.com/slub/ocrd_controller/pull/23
* add another image tag of stable version by @markusweigelt in https://github.com/slub/ocrd_controller/pull/22
* Add fixed stable version of controller by @markusweigelt in https://github.com/slub/ocrd_controller/pull/21
* Weekly update of controller image by @markusweigelt in https://github.com/slub/ocrd_controller/pull/20
* docker-compose.yml: expose port by @bertsky in https://github.com/slub/ocrd_controller/pull/18
* Fix some typos (found by codespell) by @stweil in https://github.com/slub/ocrd_controller/pull/15
* Avoid error messages because of hard links by @stweil in https://github.com/slub/ocrd_controller/pull/17
* Avoid error message because of existing directory by @stweil in https://github.com/slub/ocrd_controller/pull/16
* remove workflow server branch by @bertsky in https://github.com/slub/ocrd_controller/pull/14
* Update publish.yml by @markusweigelt in https://github.com/slub/ocrd_controller/pull/13
* Create publish gh workflow by @markusweigelt in https://github.com/slub/ocrd_controller/pull/12

**Full Changelog**: [d3c0192d96bd4e75eadf27d19d9ba9b08297cf41...b2e4a6e668990fe2a455b000c0e5895800be90e1](https://github.com/slub/ocrd_controller/compare/d3c0192d96bd4e75eadf27d19d9ba9b08297cf41...b2e4a6e668990fe2a455b000c0e5895800be90e1)

### OCR-D Manager

* Workflow volume by @bertsky in https://github.com/slub/ocrd_manager/pull/57
* Add opencontainers by @markusweigelt in https://github.com/slub/ocrd_manager/pull/56
* Test already exist by @markusweigelt in https://github.com/slub/ocrd_manager/pull/55
* Adjustment of the workflow to publish the stable image version  by @markusweigelt in https://github.com/slub/ocrd_manager/pull/54
* adapt to new core / bash by @bertsky in https://github.com/slub/ocrd_manager/pull/53
* pre_process_to_workdir: keep subdir by @bertsky in https://github.com/slub/ocrd_manager/pull/52
* Dockerfile: symlink scripts by @bertsky in https://github.com/slub/ocrd_manager/pull/51
* Replaces flask with fastapi monitor by @SvenMarcus in https://github.com/slub/ocrd_manager/pull/45
* Improvements env file by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/1
* rename dozzle → ocrd-logview by @bertsky in https://github.com/slub/ocrd_manager/pull/44
* update test-presentation check and docs by @bertsky in https://github.com/slub/ocrd_manager/pull/43
* CI: determine build args dynamically by @bertsky in https://github.com/slub/ocrd_manager/pull/41
* expose SSH port by @bertsky in https://github.com/slub/ocrd_manager/pull/42
* Update publish.yml by @markusweigelt in https://github.com/slub/ocrd_manager/pull/40
* Change bertsky to slub by @markusweigelt in https://github.com/slub/ocrd_manager/pull/39
* Update-to new repo location by @markusweigelt in https://github.com/slub/ocrd_manager/pull/37
* Fix jobs workflow by @bertsky in https://github.com/slub/ocrd_manager/pull/36

**Full Changelog**: [daed8299411dfb4f3476c5d8ea602ab9ac20c3a4...57e863fc3b9ca1ff0bff72265bba22317186c551](https://github.com/slub/ocrd_manager/compare/daed8299411dfb4f3476c5d8ea602ab9ac20c3a4...57e863fc3b9ca1ff0bff72265bba22317186c551)

### OCR-D Monitor

* fix navbar logview URL by @bertsky in https://github.com/slub/ocrd_monitor/pull/12
* Separate navigation and launching browser into different endpoints by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/9
* Improvements env file by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/1
* Replaces flask with fastapi monitor by @SvenMarcus in https://github.com/slub/ocrd_manager/pull/45
* Improvements env file by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/1
* rename dozzle → ocrd-logview by @bertsky in https://github.com/slub/ocrd_manager/pull/44
* Update-to new repo location by @markusweigelt in https://github.com/slub/ocrd_manager/pull/37
* Fix jobs workflow by @bertsky in https://github.com/slub/ocrd_manager/pull/36

**Full Changelog**: [e9b41de42658f57361a0fe0ff56d673f225e4b4d...948355be4581066d09f7ecf3d54c4a022ab97350](https://github.com/slub/ocrd_monitor/compare/e9b41de42658f57361a0fe0ff56d673f225e4b4d...948355be4581066d09f7ecf3d54c4a022ab97350)

### Kitodo.Production Docker

* Use Kitodo.Production ActiveMQ docker image of slub organization by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/17
* Update versions by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/16
* Add arg for vcs url by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/15
* Fix some typos (found by codespell) by @stweil in https://github.com/slub/kitodo-production-docker/pull/14
* Update docker compose call, updates for transfering to slub by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/13

**Full Changelog**: [5ad3a5d0b47c558e64fb5523c1a16a30b0028901...97fca72a4a37dfb21eacd331e1febc986113939a](https://github.com/slub/kitodo-production-docker/compare/5ad3a5d0b47c558e64fb5523c1a16a30b0028901...97fca72a4a37dfb21eacd331e1febc986113939a)


## [v20220706-stable](https://github.com/slub/ocrd_kitodo/releases/tag/v20220706-stable)

* simplify+flexibilize passing uid/gid by @bertsky in https://github.com/slub/ocrd_kitodo/pull/4
* make build: re-entrant by @bertsky in https://github.com/slub/ocrd_kitodo/pull/7
* Provide override configurations for Docker Compose and update Makefile  by @SvenMarcus in https://github.com/slub/ocrd_kitodo/pull/20
* Add Manager monitor, simplify and modularise config by @bertsky in https://github.com/slub/ocrd_kitodo/pull/21
* Default managed by @bertsky in https://github.com/slub/ocrd_kitodo/pull/22
* Add links and images by @bertsky in https://github.com/slub/ocrd_kitodo/pull/24
* changes for improved kitodo docker compose by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/23
* Update README.md by @bertsky in https://github.com/slub/ocrd_kitodo/pull/25
* Change ports to expose by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/26
* Add monitor jobs and logs by @bertsky in https://github.com/slub/ocrd_kitodo/pull/27
* adding prepare targets change create target to build by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/28
* Update readme by @bertsky in https://github.com/slub/ocrd_kitodo/pull/30
* split clean and provide targets to remove prepare and build files sep… by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/32
* More updates of readme by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/33

**Full Changelog**: https://github.com/slub/ocrd_kitodo/compare/v20220405-stable...v20220706-stable

## [v20220405-stable](https://github.com/slub/ocrd_kitodo/releases/tag/v20220405-stable)

Stable version of interaction between OCR-D Controller, OCR-D Manager and Kitodo.Production 3.4.1 from 2022-04-05.
