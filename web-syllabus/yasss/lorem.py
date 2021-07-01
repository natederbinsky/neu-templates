import sys
from os import path

from neutemplates import bootstrap5

from yasss import util

def main(dest: str = '_out/lorem') -> None:
    """Builds an example bootstrap5 site.
    
    A destination folder can be supplied.
    """

    this_dir = path.dirname(path.abspath(__file__))
    site_name = 'lorem'
    site_dir = path.join(this_dir, site_name)

    #

    # list of pages to render
    pages = [
        'index.html',
    ]

    # list of files relative to the site directory
    # to be copied to an analogous location in destination
    resources = [
        'img/favicon.ico',
    ]

    # arbitrary dictionary of data to supply to all pages during render
    # (the following are required for this template)
    data = {
        'source': util.link('https://loremipsum.io'),
        'param': 5,
        'showLast': False,
    }

    ##

    bootstrap5.build(
        site_dir=site_dir,
        destination=dest,

        pages=pages,
        resources=resources,
        
        data=data,
        globals={
            'bin': bin,
        },
    )


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        main()
