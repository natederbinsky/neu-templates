import sys
from os import path
from typing import Any, Callable, Dict, List, Tuple, Union

from markupsafe import Markup # type: ignore

from neutemplates import course
from yasss import util


def add_prof(name: str, img: str, email: str, web: str, phone: str, oh: str, resources: List[Union[str, Tuple[str, Callable[[str, str], bool]]]], data: Dict[str, Any]) -> None:
    """Adds a professor to the data/resources lists."""

    img_fname = 'img/{}'.format(img)
    resources.append(img_fname)

    if 'profs' not in data:
        data['profs'] = []

    data['profs'].append({
        'name': name,
        'img': img_fname,
        'email': util.email(email),
        'web': util.link(web, title='Personal Site'),
        'phone': phone,
        'oh': oh,
    })


def add_ta(name, img, email, oh, resources: List[Union[str, Tuple[str, Callable[[str, str], bool]]]], data: Dict[str, Any]) -> None:
    """Adds a TA to the data/resources lists."""

    img_fname = 'img/{}'.format(img)
    resources.append(img_fname)

    if 'tas' not in data:
        data['tas'] = []

    data['tas'].append({
        'name': name,
        'img': img_fname,
        'email': util.email(email),
        'oh': oh,
    })


def make_row(num: int, df: str, dt: str, topics: Union[Markup, str], reading: Union[Markup, str], due: Union[Markup, str]) -> Tuple[str, Union[Markup, str], Union[Markup, str], Union[Markup, str]]:
    """Creates schedule table rows."""

    return (
        '{}<br /><small>{} -<br />{}</small>'.format(num, df, dt), 
        topics, 
        reading, 
        due
    )


def read_rkt(fname: str) -> str:
    """Reads a DrRacket file, skipping the first three lines."""

    with open(fname, 'r') as f:
        for _ in range(3):
            f.readline() # skips first three lines of metadata

        return f.read()


def main(dest: str = '_out/cs1') -> None:
    """Builds a somewhat complex example course site.
    
    A destination folder can be supplied.
    """

    this_dir = path.dirname(path.abspath(__file__))
    site_name = 'cs1'
    site_dir = path.join(this_dir, site_name)

    ##

    # list of pages to render
    pages = [
        'index.html',
        'policies.html',
        'notnav.html',
        'schedule.html',
    ]

    
    def no_ignore(path: str, fname: str) -> bool:
        return ("ignore" not in path) and ("ignore" not in fname) and (fname != '.DS_Store')

    # list of files relative to the site directory
    # to be copied to an analogous location in destination;
    # can also take the form of ('relative directory', predicate('relative path', 'file name'))
    # to consider all files in a supplied path, as validate by a function
    resources: List[Union[str, Tuple[str, Callable[[str, str], bool]]]] = [
        ('readings', no_ignore),
    ]

    ##

    # map from navigation titles to valid files in pages
    nav = {
        'Home': 'index.html',
        'Policies': 'policies.html',
        'Schedule': 'schedule.html',
    }

    # key in nav to home page
    home = 'Home'

    # arbitrary dictionary of data to supply to all pages during render
    data: Dict[str, Any] = {
    }

    ##

    add_prof('Professor Smith', 'prof.jpg', 'prof.smith@northeastern.edu', 
              'https://northeastern.edu', '617-373-1234', 'Building 101, Tuesdays/Thursdays 5-6pm',
              resources, data)

    add_ta('Cecilia', 'cecilia.jpg', 'cecilia.ta@husky.neu.edu', 'TBD', resources, data)
    add_ta('Tajel', 'tajel.jpeg', 'tajel.ta@husky.neu.edu', 'TBD', resources, data)

    #

    letter_fail = 'F'
    _lt = '&lt;'
    _gte = '&ge;'

    letters = ('A', 'A-', 'B+', 'B', 'B-', 'C+', 'C', 'C-', 'D+', 'D', 'D-')
    cutoffs = (95,   90,   87,  82,   80,   77,  72,  70,   67,   62,  60)

    data['scale'] = [(l, '{} - '.format(n) if i==0 else '{} - {}{}'.format(n, _lt, cutoffs[i-1])) for i, (l, n) in enumerate(zip(letters, cutoffs))]
    data['scale'].append((letter_fail, '{}{}{}'.format('&nbsp;' * 5, _lt, cutoffs[-1])))

    #

    _headers = ('Week', 'Topics', 'Reading (completed <em>prior to lecture</em>', 'Due (default=R@6pm,<br />late=F@6pm)')

    data['weeks'] = (
        # headers = ((name, style),...)
        tuple((h, 'text-align: center') for h in _headers),
        # column styles = ('',...)
        tuple('' if i % 2 == 1 else 'text-align: center' for i,h in enumerate(_headers)),
        # rows = (('',...),...)
        (
            make_row(1, 'Sep 9', 'Sep 11',
                    util.ulist(
                        'Course/Syllabus',
                        'DBMS/Architecture',
                        'Software: {}, {}, {}'.format(
                            util.link('https://www.apachefriends.org/download.html', 'XAMPP'),
                            util.link('https://sqlitebrowser.org', 'DB Browser for SQLite'),
                            util.link('https://github.com/lerocha/chinook-database/tree/master/ChinookDatabase/DataSources', 'Chinook')
                        )
                    ),
                    '1, 2',
                    ''),
            
            make_row(2, 'Sep 14', 'Sep 18',
                    util.ulist(
                        'Relational Data Model',
                        'Relational Algebra, DML {}'.format(util.ulist('SQL Reference')),
                    ),
                    '5, 6, 8, {}'.format(util.link('readings/codd.pdf', 'Codd')),
                    ''),

            make_row(3, 'Sep 21', 'Sep 25',
                    util.ulist(
                        "DML cont'd",
                        'DDL'
                    ),
                    '6, 7, Boyce',
                    util.ulist(
                        'HW1 (SELECT, RA)',
                    ))
        )
    )

    #

    code1 = '''
; f : Number -> Number
; performs a mysterious operation to a number

(check-expect (f 1) 2)
(check-expect (f 2) 5)
(check-expect (f 3) 10)
(check-expect (f 4) 17)

(define (f x)
  (add1
   (* x x)))
    '''.strip()

    data['code1'] = util.code(code1, 'Racket')
    data['code2'] = util.code(read_rkt(path.join(site_dir, 'stuff', 'code.rkt')), 'Racket')
    data['code3'] = util.code('print("Hello, World!")', 'Python')

    #

    data['img1'] = util.inline_img('png', img_fname=path.join(site_dir, 'stuff', 'logo.png'), attrs={'class':'img-thumbnail', 'style':'width: 40%'})

    ##

    course.build(
        site_dir=site_dir,
        destination=dest,

        pages=pages,
        resources=resources,

        nav=nav,
        home=home,

        classNum='CS1', 
        className='Intro to Things', 
        semester='Fall 2021', 
        section='Section 42',
        
        data=data,
        globals={},
    )


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        main()
