# neutemplates

Useful templates for [yasss](https://github.com/natederbinsky/yasss) (Yet Another Static Site System).

## Installation/Setup (via shell)
1. Optional, (but recommended): Virtual Environment
   - `python3 -m venv venv`
   - `source venv/bin/activate`
2. `pip3 install -r requirements.txt`

## Template: `bootstrap5`
Provides each page with [bootstrap](https://getbootstrap.com) css/js.

### Basic Example (lorem ipsum)
Includes: Jinja loop/conditional, global, `util` markup
1. `python3 lorem.py`
   - You can optionally provide a path as an argument, which affects the path in the following step
2. open `_out/lorem/index.html`

### Notes
- One main Jinja template: `bootstrap5/page.jinja`
   - The `title` block is required (sets the title in head)
   - The `head` block is optional (customization of head)
   - The `content` block is required (contents of body above bootstrap js)
- No Jinja macros
- No Python functions
- No non-bootstrap css
- No extra build parameters

## Template: `course`
Provides support for multi-page navigation (via [bootstrap v3](https://getbootstrap.com/docs/3.4/)), as well as custom CSS and Jinja macros.

### Basic Example (cs0)
Includes: multi-page navigation
1. `python3 cs0.py`
   - You can optionally provide a path as an argument, which affects the path in the following step
2. open `_out/cs0/index.html`

### Complex Example (cs1)
Adds: page not in navigation, downloadable resources (added via directory + predicate), non-page/resource files, Jinja macros, embedding code/images via Python
1. `python3 cs1.py`
   - You can optionally provide a path as an argument, which affects the path in the following step
2. open `_out/cs1/index.html`

### Notes
- One main Jinja template: `course/page.jinja`
   - The `title` block is required (sets the title in head)
   - The `head` block is optional (customization of head)
   - The `content` block is required (contents of body between logo and footer)
- Jinja macros (primarily to support CSS)
   - `section`: creates a visual page block with an optional title, optional auto-indentation, and arbitrary caller contents
   - `sectionKV`: within a section, a key-value table (via a supplied mapping)
   - `sectionPerson`: within a section, a consistent way to visualize a person's name, image, and arbitrary (key/value) information with optional auto-indentation
   - `sectionTable`: within a section, a way to produce a table given a list of headers (each a tuple of name and style), per-column styling, and row data.
   - `sectionGradingScale`: within a section, a way to produce a table of grade cutoffs given a list of (letter, range) tuples.
   - `sectionClassroomEnvironment`: within a section, text blurb for classroom environment/Title IX/DRC, as well as optional COVID-19.
- No Python functions
- Non-bootstrap CSS includes...
   - Code highlighting via `pygments` in Python/Jinja highlighting
   - The `section` and `keyvalue` classes to support the above macros
- Build parameters support the navbar and consistent heading/titling, including...
   - `nav`: a mapping between titles and pages for the navbar
   - `home`: the key of the nav mapping that is the home page
   - `classNum`: the course code (e.g., "CS1")
   - `className`: the course name (e.g., "Introduction to X")
   - `semester`: the semester name (e.g., "Fall 2021")
   - `section`: the section designation (e.g., "Section 1")
