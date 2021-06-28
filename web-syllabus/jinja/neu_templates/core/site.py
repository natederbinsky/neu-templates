from sys import stderr
from os import makedirs, path
from shutil import rmtree, copyfile

from jinja2 import Environment, PrefixLoader, PackageLoader, select_autoescape

# utility helper for error output
def eprint(msg):
    print(msg, file=stderr)

# removes an output directory
def clean(destination):
    if path.exists(destination) and path.isdir(destination):
        rmtree(destination)

# build an output site
def build(templ_dir, site_dir, destination, pages, templ_resources, site_resources, templ_data, site_data, globals):
    ###
    # Remove/create the destination folder
    ###

    clean(destination)
    makedirs(destination)

    ###
    # Render page templates
    ###

    PACKAGE = 'neu_templates'

    TEMPLPACKAGE = 'templates'

    SITEPACKAGE = 'sites'
    SITEPREFIX = 'site'

    env = Environment(
        extensions=['jinja2_highlight.HighlightExtension'],
        loader=PrefixLoader({
            templ_dir: PackageLoader(PACKAGE, '{}/{}'.format(TEMPLPACKAGE, templ_dir)),
            SITEPREFIX: PackageLoader(PACKAGE, '{}/{}'.format(SITEPACKAGE, site_dir))
        }),
        autoescape=select_autoescape(enabled_extensions=('htm', 'html'))
    )
    env.globals.update(**globals)

    for fname in pages:        
        env.get_template('{}/{}'.format(SITEPREFIX, fname)) \
        .stream(_tdata=templ_data, data=site_data) \
        .dump(path.join(destination, fname))

    ###
    # Copy static resources
    ###

    def resource_copy(fname, base):
        d_fname = path.join(destination, fname)
        makedirs(path.dirname(d_fname), exist_ok=True)

        s_fname = \
            path.join(PACKAGE, TEMPLPACKAGE, templ_dir, fname) \
                if base else \
                    path.join(PACKAGE, SITEPACKAGE, site_dir, fname)

        copyfile(s_fname, d_fname)

    

    for fname in templ_resources:
        resource_copy(fname, True)

    for fname in site_resources:
        resource_copy(fname, False)

