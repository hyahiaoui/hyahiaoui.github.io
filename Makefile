.DEFAULT_GOAL := help

# Enable One Shell, to allow heredocs in the Makefile targets
# cf. https://www.gnu.org/software/make/manual/html_node/One-Shell.html
.ONESHELL:

.PHONY: help
help:	## Display the available targets in the Makefile and their descriptions
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

# Variables
MKDOCS = poetry run mkdocs
MKDOCS_BUILD = $(MKDOCS) build
MKDOCS_SERVE = $(MKDOCS) serve
MKDOCS_BLOG = $(MKDOCS) blog

serve:	## Serve documentation on 
	$(MKDOCS_SERVE)

build:	## Build the documentation site.
	$(MKDOCS_BUILD)

new-blog:	## Create a new blog post.
	@if [ -z "$$title" ]; then \
        echo "title is not set. Usage: make new-blog title=\"My new blog post\""; \
        exit 1; \
    fi
	@mkdir -p docs/blog/posts
	@echo "---\ndraft: true\ntitle: $(title)\ndate: $(shell date +"%Y-%m-%d")\nauthors: [hyahiaoui]\ndescription: >\n  $(title)\ncategories:\n  - General\n---\n\n# $(title)\n" > "docs/blog/posts/$(shell echo $(title) | tr '[A-Z]' '[a-z]' | tr ' ' '-' | tr -c -d '[a-z0-9-]').md"

clean:	## Clean built documentation site.
	rm -rf site
