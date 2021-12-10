MD2HTML := pandoc

SRCS := $(wildcard *.md)
DST_DIR ?= dst

all: $(SRCS:%.md=%.html)

%.html: %.md
	mkdir -p $(DST_DIR)
	cp style.css $(DST_DIR)
	cat _header.html > $(DST_DIR)/$@
	$(MD2HTML) $< >> $(DST_DIR)/$@
	cat _footer.html >> $(DST_DIR)/$@

clean:
	rm -rvf $(DST_DIR)
