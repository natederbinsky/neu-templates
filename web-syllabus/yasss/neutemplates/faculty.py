from typing import Any, Callable, Dict, Iterable, List, Mapping, Optional, Tuple, Union
from typing_extensions import Literal

from enum import Enum

from os import path

from datetime import date

from yasss import gen

##

class Badge(Enum):
    """Types of badges."""
    CUSTOM = 1
    LINKEDIN = 2
    GSCHOLAR = 3
    GITHUB = 4

def make_custom_badge(url: str, img: str) -> Tuple[Badge, str, str]:
    """Produces a custom badge via a url and image."""
    return (Badge.CUSTOM, url, img)

def make_linkedin(id: str) -> Tuple[Badge, str, str]:
    """Produces a LinkedIn badge given a user id."""
    return (Badge.LINKEDIN, 'https://www.linkedin.com/in/{}'.format(id), 'img/_badges/linkedin.png')

def make_gscholar(id: str, lang: str='en') -> Tuple[Badge, str, str]:
    """Produces a Google Scholar badge given a user id."""
    return (Badge.GSCHOLAR, 'https://scholar.google.com/citations?hl={}&user={}'.format(lang, id), 'img/_badges/gscholar.ico')

def make_github(id: str) -> Tuple[Badge, str, str]:
    """Produces a GitHub badge given a user id."""
    return (Badge.GITHUB, 'https://github.com/{}'.format(id), 'img/_badges/github.png')

##

def build(site_dir: str, destination: str, pages: Iterable[str], resources: List[Union[str, Tuple[str, Callable[[str, str], bool]]]], nav: Mapping[str, str], home: str, personName: str, contactEmail: str, modDate: date, favicon: str, ganalytics: Optional[str]=None, badges: Iterable[Tuple[Badge, str, str]] = (), data: Mapping[str, Any]={}, globals: Mapping[str, Any]={}) -> bool:
    """Builds a site using the faculty template."""

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

    templ_name='faculty'

    templ_resources = [
        'css/bootstrap.min.css',
        'css/faculty.css',

        'fonts/glyphicons-halflings-regular.eot',
        'fonts/glyphicons-halflings-regular.woff',
        'fonts/glyphicons-halflings-regular.woff2',
        'fonts/glyphicons-halflings-regular.svg',
        'fonts/glyphicons-halflings-regular.ttf',

        'js/bootstrap.min.js',
        'js/jquery.min.js',
    ]

    for badge in badges:
        if badge[0] != Badge.CUSTOM:
            templ_resources.append(badge[2])
        else:
            resources.append(badge[2])

    templ_data: Dict[str, Any] = {
        'name': personName,
        'email': contactEmail,
        
        'nav': nav,
        'home': home,

        'favicon': favicon,
        'year': modDate.year,
        'mod': modDate.strftime('%d %B %Y'),

        'badges': badges,
        'ganalytics': ganalytics
    }
    templ_data['name_small'] = templ_data['name'][:max(19, len(templ_data['name']))]

    templ_globals = dict(globals)
    templ_globals['nav'] = nav

    ##

    return gen.build(
        templ_name=templ_name,
        templ_dir=path.join(path.dirname(path.abspath(__file__)), templ_name),
        site_dir=site_dir,
        destination=destination,

        pages=pages,

        templ_resources=templ_resources,
        site_resources=resources + [favicon], 
        
        templ_data=templ_data,
        site_data=data,

        globals=templ_globals
    )
