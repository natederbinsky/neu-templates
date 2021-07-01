# neutemplates

Useful templates for [yasss](https://github.com/natederbinsky/yasss) (Yet Another Static Site System).

## Installation/Setup (via shell)
1. Optional, (but recommended): Virtual Environment
   - `python3 -m venv venv`
   - `source venv/bin/activate`
2. `pip3 install -r requirements.txt`

## Basic Example (lorem ipsum site via `bootstrap5` template)
Includes: Jinja loop/conditional, global, `util` markup
1. `python3 lorem.py`
   - You can optionally provide a path as an argument, which affects the path in the following step
2. open `_out/lorem/index.html`

## Basic Course Example (multi-page via `course` template)
Includes: multi-page navigation
1. `python3 cs0.py`
   - You can optionally provide a path as an argument, which affects the path in the following step
2. open `_out/cs0/index.html`

## Complex Example (most of a course via `course` template)
Adds: page not in navigation, downloadable resource, non-page/resource files, Jinja macros, embedding code/images via Python
1. `python3 cs1.py`
2. open `_out/cs1/index.html`
