from neutemplates.core import site

def build(site_dir, destination, pages, resources, nav, home, classNum, className, semester, section, data={}, globals={}, site_pkg=True):
    # validate nav
    for title, fname in nav.items():
        if fname not in pages:
            site.eprint('Invalid navigation path: {} ({})'.format(fname, title))
            return False

    # validate home
    if home not in nav:
        site.eprint('Invalid nav home: {}'.format(home))
        return False

    templ_resources = [
        'img/favicon.ico',
        'img/logo.png',
        'css/bootstrap.min.css',
        'css/custom.css',
        'css/code.css',
        'js/bootstrap.min.js',
        'js/jquery.min.js',
    ]

    # build template data
    templ_data = {
        'site_title': classNum,
        
        'nav': nav,
        'home': home,
        
        'semester': semester,
        'section': section,
        
        'brand_big': '{} | {}'.format(classNum, className),
    }
    templ_data['brand_small'] = templ_data['brand_big'][:max(19, len(templ_data['brand_big']))]

    # add required template globals
    templ_globals = globals.copy()
    templ_globals['zip'] = zip

    ##

    site.build(
        templ_name='course', 
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
