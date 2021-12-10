MD2HTML := pandoc --template template.html

SRCS := $(wildcard *.md)
DST_DIR ?= dst

all: $(SRCS:%.md=%.html)

%.html: %.md
	mkdir -p $(DST_DIR)
	cp style.css $(DST_DIR)
	$(MD2HTML) $< -o $(DST_DIR)/$@

clean:
	rm -rvf $(DST_DIR)
