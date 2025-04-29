.PHONY: copy-wiki-source clean run fetch-contributors build

copy-wiki-source:
	@echo "Copying wiki content from themes/typo/wiki to content/"
	cp -r themes/typo/wiki content
	./scripts/build_content.sh

clean: 
	@echo "Cleaning up build artifacts..."
	@if [ -d public ]; then rm -r public; fi

run: clean copy-wiki-source 
	@echo "Starting Hugo server..."
	hugo server --disableFastRender -D

build: copy-wiki-source
	@echo "Building the Hugo site..."
	hugo --minify --buildFuture

push: 
	git submodule update --remote --merge
	git add . && git commit -m "Update wiki" && git push
