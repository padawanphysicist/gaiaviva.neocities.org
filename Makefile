HAUNT=GUILE_LOAD_PATH=./ haunt
all: linktree

.PHONY: linktree
linktree:
	$(HAUNT) build

watch:
	$(HAUNT) serve --watch
autobuild:
	bash ./assets/bin/auto-build.bash
