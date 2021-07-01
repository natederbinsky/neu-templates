import sys
from os import path
from typing import Any, Dict, List

from neutemplates import course
from yasss import util

def main(dest: str = '_out/cs0') -> None:
    """Builds a simple example course site.
    
    A destination folder can be supplied.
    """

    this_dir = path.dirname(path.abspath(__file__))
    site_name = 'cs0'
    site_dir = path.join(this_dir, site_name)

    ##

    # list of pages to render
    pages = [
        'index.html',
        'other.html',
    ]

    # list of files relative to the site directory
    # to be copied to an analogous location in destination
    resources: List[str] = [
    ]

    ##

    # map from navigation titles to valid files in pages
    nav = {
        'Home': 'index.html',
        'Other': 'other.html',
    }

    # key in nav to home page
    home = 'Home'

    # arbitrary dictionary of data to supply to all pages during render
    data: Dict[str, Any] = {
    }

    ##

    course.build(
        site_dir=site_dir,
        destination=dest,

        pages=pages,
        resources=resources,

        nav=nav,
        home=home,

        classNum='CS0', 
        className='Conceptual Stuffs', 
        semester='Fall 2021', 
        section='Section 1',
        
        data=data,
        globals={},
    )


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        main()
