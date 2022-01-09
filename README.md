# Sources for my personal website
<https://svenmoeller.xyz>

* [Local Mirror](https://svenmoeller.xyz/git/website)
* [GitHub Mirror](https://github.com/svemoe/website)
* [GitLab Mirror](https://gitlab.com/svemoe/website)

## Prerequisites

- [Pandoc](https://pandoc.org/)
- [GNU make](https://www.gnu.org/software/make/)
- `rsync`

## Build instructions

    make

Will build the website to the target directory.
Standard is `./dst/`, can be changed with `DST_DIR`.

    make clean

Removes the target directory.

## Source files

The pages are written in `markdown` format.
The level 1 heading will be used as title of the page.
Links with the extension `.md` will be changed to `.html`.

The `template.html` gets used by `pandoc` to convert the pages to `html`.

The contents of the `static` folder are copied to the target directory verbatim.

The `Makefile` contains the recipe for building the website from source.

## Deployment

I have a `git post-receive` hook that checks out the work tree to a directory on the server.

The hook then runs `make` inside this directory.
`DST_DIR` points to the place from where I serve the page with `nginx`.

### See also 

- <https://toroid.org/git-website-howto>
