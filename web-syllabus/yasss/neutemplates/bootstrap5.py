from typing import Any, Callable, Iterable, Mapping, Tuple, Union
from typing_extensions import Literal

from os import path

from yasss import gen


def build(site_dir: str, destination: str, pages: Iterable[str], resources: Iterable[Union[str, Tuple[str, Callable[[str, str], bool]]]], data: Mapping[str, Any]={}, globals: Mapping[str, Any]={}) -> Literal[True]:
    """Builds a site using the bootstrap5 template."""
    
    templ_name='bootstrap5'

    templ_resources = [
        'css/bootstrap.min.css',
        'js/bootstrap.bundle.min.js',
    ]

    ##

    return gen.build(
        templ_name=templ_name, 
        templ_dir=path.join(path.dirname(path.abspath(__file__)), templ_name),
        site_dir=site_dir,
        destination=destination,

        pages=pages,

        templ_resources=templ_resources,
        site_resources=resources, 
        
        templ_data={},
        site_data=data,

        globals=globals,
    )
