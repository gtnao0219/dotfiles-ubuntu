.DEFAULT_GOAL := help

install_node: ## Install nodejs
	./scripts/node/install.sh

install_go: ## Install golang
	./scripts/go/install.sh

install_ruby: ## Install ruby by rbenv
	./scripts/ruby/install.sh

install_rust: ## Install rust by rustup
	./scripts/rust/install.sh

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

