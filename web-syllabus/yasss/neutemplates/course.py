from typing import Any, Callable, Dict, Iterable, Mapping, Tuple, Union
from typing_extensions import Literal

from os import path

from datetime import date

from yasss import gen


def build(site_dir: str, destination: str, pages: Iterable[str], resources: Iterable[Union[str, Tuple[str, Callable[[str, str], bool]]]], nav: Mapping[str, str], home: str, classNum: str, className: str, semester: str, section: str, data: Mapping[str, Any]={}, globals: Mapping[str, Any]={}) -> bool:
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

        'now': date.today().strftime('%d %B %Y'),
    }
    _maxlen = 24
    templ_data['brand_small'] = templ_data['brand_big'][:min(_maxlen, len(templ_data['brand_big']))] + ('...' if len(templ_data['brand_big'])>_maxlen else '')

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
