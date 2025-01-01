.PHONY: copy-wiki-source clean run fetch-contributors build

copy-wiki-source:
	@echo "Copying wiki content from themes/typo/wiki to content/"
	cp -r themes/typo/wiki content

clean: 
	@echo "Cleaning up build artifacts..."
	@if [ -d public ]; then rm -r public; fi

run: 
	@echo "Starting Hugo server..."
	hugo server --disableFastRender -D

fetch-contributors:
	@echo "Generating contributors list..."
	python3 scripts/contributors.py

build: copy-wiki-source fetch-contributors
	@echo "Building the Hugo site..."
	hugo --minify --buildFuture
