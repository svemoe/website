DST_DIR ?= dst

SRCS := $(wildcard *.md)
DSTS := $(SRCS:%.md=$(DST_DIR)/%.html)

.PHONY: all clean

all: $(DSTS) $(DST_DIR)/style.css

$(DST_DIR)/%.html: %.md template.html | $(DST_DIR)
	title=$$(sed -nE 's/^#\s+//p' $<); \
	sed 's/\.md/\.html/g' $< | pandoc --template template.html --metadata title="$$title" -o $@

$(DST_DIR)/style.css: style.css | $(DST_DIR)
	cp $< $@

$(DST_DIR):
	mkdir -p $@

clean:
	rm -rvf $(DST_DIR)
