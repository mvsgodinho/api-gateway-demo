# import config.
# You can change the default config with `make config="another.env" build`
config ?= default.env
include $(config)
export $(shell sed 's/=.*//' $(config))

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

install: ## install dependencies
	pip install -r requirements.txt
	
start: install ## start containers
	docker-compose up -d --build

stop: ## stop containers
	docker-compose down

reload: ## reload configs
	docker-compose exec web nginx -s reload

test: reload ## run integration tests
	pytest -sv ./tests/spec/