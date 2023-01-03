from __future__ import annotations

import sys
from os import path
from typing import Any, Callable, Dict, List, Tuple, Union

from markupsafe import Markup # type: ignore

from neutemplates import faculty

import datetime

##

def main(dest: str = '_out/smith') -> None:
    """Builds a simple example faculty site.
    
    A destination folder can be supplied.
    """

    this_dir = path.dirname(path.abspath(__file__))
    site_name = 'smith'
    site_dir = path.join(this_dir, site_name)

    ##

    # list of pages to render
    pages = [
        'index.html',
        'research.html',
        'cv.html',
    ]

    # list of files relative to the site directory
    # to be copied to an analogous location in destination
    resources: List[Union[str, Tuple[str, Callable[[str, str], bool]]]] = [
        'img/favicon.ico',
        'img/smith.jpg',
        'img/nobel.png',
        'img/screenshot.png',

        'files/imitation.pdf',
    ]

    ##

    # map from navigation titles to valid files in pages
    nav = {
        'About': 'index.html',
        'Research': 'research.html',
        'CV': 'cv.html',
    }

    # key in nav to home page
    home = 'About'

    # arbitrary dictionary of data to supply to all pages during render
    data: Dict[str, Any] = {
        'name': 'Prof Smith',
        'email': 'prof.smith@phdcomics.com',
        'tagline': 'Do more research',
        'mug': 'img/smith.jpg'
    }

    ##

    faculty.build(
        site_dir=site_dir,
        destination=dest,

        pages=pages,
        resources=resources,

        nav=nav,
        home=home,

        personName=data['name'],
        contactEmail=data['email'],
        modDate=datetime.datetime.now(),
        favicon='img/favicon.ico',

        badges=(
            faculty.make_gscholar('VWCHlwkAAAAJ'),
            faculty.make_linkedin('barackobama'),
            faculty.make_github('torvalds')
        ),
        
        data=data,
        globals={},
    )

if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        main()
