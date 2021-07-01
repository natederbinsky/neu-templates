from typing import Any, Dict, Iterable, Mapping
from typing_extensions import Literal

from os import path

from yasss import gen


def build(site_dir: str, destination: str, pages: Iterable[str], resources: Iterable[str], nav: Mapping[str, str], home: str, classNum: str, className: str, semester: str, section: str, data: Mapping[str, Any]={}, globals: Mapping[str, Any]={}) -> bool:
    """Builds a site using the course template."""

    # validate nav
    for title, fname in nav.items():
        if fname not in pages:
            gen.eprint('Invalid navigation path: {} ({})'.format(fname, title))
            return False

    # validate home
    if home not in nav:
        gen.eprint('Invalid nav home: {}'.format(home))
        return False

    ##

    templ_name='course'

    templ_resources = [
        'img/favicon.ico',
        'img/logo.png',
        'css/bootstrap.min.css',
        'css/custom.css',
        'css/code.css',
        'js/bootstrap.min.js',
        'js/jquery.min.js',
    ]

    templ_data: Dict[str, Any] = {
        'site_title': classNum,
        
        'nav': nav,
        'home': home,
        
        'semester': semester,
        'section': section,
        
        'brand_big': '{} | {}'.format(classNum, className),
    }
    templ_data['brand_small'] = templ_data['brand_big'][:max(19, len(templ_data['brand_big']))]

    templ_globals = dict(globals)
    templ_globals['zip'] = zip

    ##

    return gen.build(
        templ_name=templ_name,
        templ_dir=path.join(path.dirname(path.abspath(__file__)), templ_name),
        site_dir=site_dir,
        destination=destination,

        pages=pages,

        templ_resources=templ_resources,
        site_resources=resources, 
        
        templ_data=templ_data,
        site_data=data,

        globals=templ_globals
    )
