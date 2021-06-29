from neutemplates.core import site

def build(site_dir, destination, pages, resources, data={}, globals={}, site_pkg=True):
    templ_resources = [
        'css/bootstrap.min.css',
        'js/bootstrap.bundle.min.js',
    ]

    # build template data
    templ_data = {
    }

    # add required template globals
    templ_globals = globals.copy()

    ##

    site.build(
        templ_name='bootstrap5', 
        site_dir=site_dir,
        destination=destination,

        pages=pages,
        templ_resources=templ_resources,
        site_resources=resources, 
        
        templ_data=templ_data,
        site_data=data,
        globals=templ_globals,

        site_pkg=site_pkg
    )