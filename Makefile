build:
	hugo --minify --buildFuture

clean: 
	rm -r public

run: 
	hugo server --disableFastRender -D

fetch-contributors:
	python3 scripts/contributors.py

all: fetch-contributors rebuild
