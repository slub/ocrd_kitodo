# What's Changed

## [v20230405-stable](https://github.com/slub/ocrd_kitodo/releases/v20230405-stable)

### Integration of OCR-D and Kitodo

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

**Full Changelog**: https://github.com/slub/ocrd_kitodo/compare/79bda3b2f33181d7f4fcd13f02b482f912078eef...7cad5d37963a288697ec172350885c55dd7b1d21

### OCR-D Controller

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

**Full Changelog**: https://github.com/slub/ocrd_controller/compare/d3c0192d96bd4e75eadf27d19d9ba9b08297cf41...fc1a599506aeb165aacefd82238ff2fa75a2a8c6

### OCR-D Manager

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

**Full Changelog**: https://github.com/slub/ocrd_manager/compare/daed8299411dfb4f3476c5d8ea602ab9ac20c3a4...a42880baa54e6cbcc2b0b3bb877e4ae9b182a72c

### OCR-D Monitor

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

**Full Changelog**: https://github.com/slub/ocrd_monitor/compare/e9b41de42658f57361a0fe0ff56d673f225e4b4d...48bdc8212eabec84ee5b1d387a35ce616bfdd945

