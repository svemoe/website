DST_DIR ?= dst

SRCS := $(wildcard *.md)
DSTS := $(SRCS:%.md=$(DST_DIR)/%.html)

.PHONY: all static clean

all: $(DSTS) static

$(DST_DIR)/%.html: %.md template.html | $(DST_DIR)
	title=$$(sed -nE 's/^#\s+//p' $<); \
	sed 's/\.md)/\.html)/g' $< | pandoc --template template.html --metadata title="$$title" -o $@

$(DST_DIR):
	mkdir -p $@

static: | $(DST_DIR)
	rsync -v static/* $(DST_DIR)

clean:
	rm -rvf $(DST_DIR)
