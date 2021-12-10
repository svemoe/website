# Building a static website


Here I describe how I (automatically) build my website.

## Source files

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

I use `git` for version control.
The changes get pushed to a bare repo on my server.

There I have a `post-receive` hook that checks out the work tree to a folder on the server.

The hook then runs `make clean` and `make` inside this folder.
This builds the website to the destination folder.

I have `nginx` set up to serve content from this destination folder.

## Workflow

I make changes to the site by editing the local `markdown` files.
Then I commit the changes to my hit repo.
When I push the changes to the server the `git` hook will take care of the rest.