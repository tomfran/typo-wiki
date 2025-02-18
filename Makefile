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

build: copy-wiki-source
	@echo "Building the Hugo site..."
	hugo --minify --buildFuture
