# Changelog

## [v20230619-stable](https://github.com/slub/ocrd_kitodo/releases/tag/v20230619-stable)

### Integration of OCR-D and Kitodo

* Update stable release workflow by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/85
* Fix stable release pr by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/83
* Merge main branch into stable branch by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/82
* Improve kitodo process ocr script to support workflow, script and lan… by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/80
* Update submodules by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/79
* Fix make test kitodo by @bertsky in https://github.com/slub/ocrd_kitodo/pull/77
* Add changelog generation by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/72
* Workflows volume by @bertsky in https://github.com/slub/ocrd_kitodo/pull/74
* Update submodules by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/71
* Add before startup script for ssh config for manager by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/69
* Update makefile-ci.yml by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/66
* Add make test-kitodo by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/63
* Add make equivalent for docker compose pull by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/62
* Update submodule and add monitor by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/61
* Rename dozzle logview by @bertsky in https://github.com/slub/ocrd_kitodo/pull/59
* Mkdocs material documentation by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/58
* update to fixed Controller by @bertsky in https://github.com/slub/ocrd_kitodo/pull/57
* rules and docs for external Production by @bertsky in https://github.com/slub/ocrd_kitodo/pull/56
* Fix typo (found by codespell) by @stweil in https://github.com/slub/ocrd_kitodo/pull/55
* Rename to ocrd_kitodo by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/53
* Update publish.yml by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/52
* Update ocrd-manager submodule by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/51
* Update paths and submodules to transfered repo by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/50
* Update repository paths and submodules by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/49
* Add test by @bertsky in https://github.com/slub/ocrd_kitodo/pull/47
* Extend sample data using seperate script for METS processing, Splits example data and necessary data of setup Makefile process by @markusweigelt in https://github.com/slub/ocrd_kitodo/pull/44

**Full Changelog**: [79bda3b2f33181d7f4fcd13f02b482f912078eef...9f9ca05613c29850b4391f1930c967e774b01b6b](https://github.com/slub/ocrd_kitodo/compare/79bda3b2f33181d7f4fcd13f02b482f912078eef...9f9ca05613c29850b4391f1930c967e774b01b6b)

### OCR-D Controller

* Revert CUDA count all by @bertsky in https://github.com/slub/ocrd_controller/pull/32
* Dockerfile: add label-schema and OCI labels by @bertsky in https://github.com/slub/ocrd_controller/pull/31
* docker-compose.yml: set device count: all explicitly by @bertsky in https://github.com/slub/ocrd_controller/pull/29
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

**Full Changelog**: [d3c0192d96bd4e75eadf27d19d9ba9b08297cf41...4b929615254859b7c03ba320a2ffee3989e9fa10](https://github.com/slub/ocrd_controller/compare/d3c0192d96bd4e75eadf27d19d9ba9b08297cf41...4b929615254859b7c03ba320a2ffee3989e9fa10)

### OCR-D Manager

* Send ocr processing messages to active mq by @markusweigelt in https://github.com/slub/ocrd_manager/pull/60
* Dockerfile labels by @markusweigelt in https://github.com/slub/ocrd_manager/pull/58
* test: improve error msg if container not running by @bertsky in https://github.com/slub/ocrd_manager/pull/59
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

**Full Changelog**: [daed8299411dfb4f3476c5d8ea602ab9ac20c3a4...690f5cf55db139d9e6947dad0903154430782148](https://github.com/slub/ocrd_manager/compare/daed8299411dfb4f3476c5d8ea602ab9ac20c3a4...690f5cf55db139d9e6947dad0903154430782148)

### OCR-D Monitor

* Make test by @bertsky in https://github.com/slub/ocrd_monitor/pull/25
* Dockerfile labels by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/27
* bug fixes and more by @bertsky in https://github.com/slub/ocrd_monitor/pull/24
* Mypy checks tests. Run integration tests in CI by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/23
* Refactor to BrowserClient. Unify tests with spies and fakes by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/22
* Port process spawning to asyncio by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/21
* Test CI by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/19
* Fix reopening browser after closing GTK window by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/13
* Merge master changes to ci by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/20
* Migrate to pyproject.toml by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/18
* Use httpx instead of requests by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/16
* fix navbar logview URL by @bertsky in https://github.com/slub/ocrd_monitor/pull/12
* Separate navigation and launching browser into different endpoints by @SvenMarcus in https://github.com/slub/ocrd_monitor/pull/9
* Improvements env file by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/1
* Replaces flask with fastapi monitor by @SvenMarcus in https://github.com/slub/ocrd_manager/pull/45
* Improvements env file by @markusweigelt in https://github.com/slub/ocrd_monitor/pull/1
* rename dozzle → ocrd-logview by @bertsky in https://github.com/slub/ocrd_manager/pull/44
* Update-to new repo location by @markusweigelt in https://github.com/slub/ocrd_manager/pull/37
* Fix jobs workflow by @bertsky in https://github.com/slub/ocrd_manager/pull/36

**Full Changelog**: [e9b41de42658f57361a0fe0ff56d673f225e4b4d...b372d2032310a6015a13ebe0ab2ee2edbcb168d1](https://github.com/slub/ocrd_monitor/compare/e9b41de42658f57361a0fe0ff56d673f225e4b4d...b372d2032310a6015a13ebe0ab2ee2edbcb168d1)

### Kitodo.Production Docker

* Add APP_CONFIG by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/21
* Add ngrok by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/20
* Add expose ngrok by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/19
* Use Kitodo.Production ActiveMQ docker image of slub organization by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/17
* Update versions by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/16
* Add arg for vcs url by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/15
* Fix some typos (found by codespell) by @stweil in https://github.com/slub/kitodo-production-docker/pull/14
* Update docker compose call, updates for transfering to slub by @markusweigelt in https://github.com/slub/kitodo-production-docker/pull/13

**Full Changelog**: [5ad3a5d0b47c558e64fb5523c1a16a30b0028901...9359363e0cc9f54a519b5485eaaf450bd9340b6c](https://github.com/slub/kitodo-production-docker/compare/5ad3a5d0b47c558e64fb5523c1a16a30b0028901...9359363e0cc9f54a519b5485eaaf450bd9340b6c)

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
