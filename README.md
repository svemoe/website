# Building a static website

## Source files

Here I describe how I (automatically) build my website.

The pages are written in `markdown` format.

I have two `html` documents, `_header.html` and `_footer.html`.
They get added at the beginning and the end of the page (respectively).
So I can change something in the header or the footer and it will change on all pages.

The style is defined in a stylesheet called `style.css`.


## Build process

I use a `Makefile` for building the website.
The destination folder for building defaults to `./dst` but can be changed with the environment variable `DST_DIR`.

The default target (`make all`) creates the destination folder
and copies the stylesheet and all the `markdown` files (converted to `html`,
with header and footer added) to the folder.
I convert them to `html` using `pandoc`, but every other converter would do.

`make clean` will remove the destination folder and all its contents.

## Deployment

## Workflow
