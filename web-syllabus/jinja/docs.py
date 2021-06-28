from neu_templates import bootstrap5, webutil

# list of files in custom subdirectory
pages = [
    'index.html',
]

# list of files relative to the custom subdirectory
# to be copied to an analogous location in destination
resources = [
    'img/favicon.ico',
]

# arbitrary dictionary of data to supply to all pages during render
# (the following are required for this template)
data = {
    'system': 'neu-templates',
}

##

bootstrap5.build(
    site_dir='docs',
    destination='_out/docs',

    pages=pages,
    resources=resources,
    
    data=data,
    globals={
        'bin': bin,
    },
)
