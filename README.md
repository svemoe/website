---
title: Sources for my personal website
---

See <https://svenmoeller.xyz>

## Prerequisites

- `pandoc`
- `git`
- `make`

## Build instructions

    make

Will build it to the target directory.
Standard is `./dst/`, can be changed with `DST_DIR`.

    make clean

Removes the target directory.

## Source files

The pages are written in `markdown` format.
The title of the page is defined in a `yaml` block at the beginning of the file.

The `template.html` gets used by `pandoc` to convert the pages to `html`.

The appearance of the website is defined in `style.css`.

The `Makefile` contains the recipe for building the website from source.

## Deployment

I have a `git post-receive` hook that checks out the work tree to a directory on the server.

The hook then runs `make` inside this directory.
`DST_DIR` points to the place from where I serve the page with `nginx`.

## See also

- <https://toroid.org/git-website-howto>
